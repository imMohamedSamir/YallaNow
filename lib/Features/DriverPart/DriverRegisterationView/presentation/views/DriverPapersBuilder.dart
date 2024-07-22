import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/data/models/DrRegisterModel.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/manager/DriverFileMangement.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/manager/driver_registeration_cubit/driver_registeration_cubit.dart';
import 'package:yallanow/generated/l10n.dart';
import 'package:pdf/widgets.dart' as pw;

class DriverPapersBuilder extends StatefulWidget {
  const DriverPapersBuilder({super.key, required this.textEditingController});
  final TextEditingController textEditingController;
  @override
  DriverPapersBuilderState createState() => DriverPapersBuilderState();
}

class DriverPapersBuilderState extends State<DriverPapersBuilder> {
  final List<File?> _driverPapers = List<File?>.filled(9, null);
  final ImagePicker _picker = ImagePicker();
  late DriverRegisterModel driverDetails;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  Future<void> _pickImage(int index) async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _driverPapers[index] = File(image.path);
        });
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  String? _validateImages(value) {
    if (_driverPapers.any((img) => img == null)) {
      return S.of(context).driverPapersValidation;
    }
    return null;
  }

  @override
  void initState() {
    driverDetails =
        BlocProvider.of<DriverRegisterationCubit>(context).driverRegisterModel;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<File> convertImagesToPdfFile(List<File?> imageFiles) async {
    final pdf = pw.Document();
    final titles = [
      S.of(context).id_card,
      S.of(context).driving_license,
      S.of(context).scooter_license,
      S.of(context).birth_certificate,
      S.of(context).criminal_record,
      S.of(context).drug_test,
    ];
    final subtitles = ['امامى', 'خلفى'];

    for (int i = 0; i < imageFiles.length; i++) {
      if (imageFiles[i] != null) {
        final image = pw.MemoryImage(imageFiles[i]!.readAsBytesSync());
        pdf.addPage(
          pw.Page(
            pageFormat: PdfPageFormat.a4,
            build: (pw.Context context) {
              return pw.Column(
                children: [
                  pw.Text(i < titles.length ? titles[i ~/ 2] : '',
                      style: pw.TextStyle(
                        color: const PdfColor.fromInt(0xFF1F2937),
                        fontSize: getResponsiveFontSize(context, fontSize: 18),
                      )),
                  if (i < titles.length * 2 && i % 2 == 1)
                    pw.Text(subtitles[i % 2]),
                  pw.SizedBox(height: 16),
                  pw.Image(image),
                ],
              );
            },
          ),
        );
      }
    }

    final directory = await getExternalStorageDirectory();
    final file = File("${directory!.path}/driverPapers.pdf");
    await file.writeAsBytes(await pdf.save());

    if (await file.exists()) {
      log('Number of pages: ${pdf.document.pdfPageList.pages.length}');
      final fileSize = await file.length();
      log('File size: $fileSize bytes');
      log("PDF saved at ${file.path}");
    } else {
      log("Failed to save PDF.");
    }
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: FormField(
        validator: _validateImages,
        onSaved: (_) async {
          if (_driverPapers.isNotEmpty) {
            FileDetails fileDetails = FileDetails();
            fileDetails.driverFile =
                await convertImagesToPdfFile(_driverPapers);
            fileDetails.contentType = "driverPapers.pdf";
            fileDetails.fileName = "driverPapers.pdf";
            fileDetails.fileSize = await fileDetails.driverFile?.length() ?? 0;
            driverDetails.driverPapers = fileDetails;
          }
        },
        builder: (FormFieldState<String> state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(S.of(context).driverPapers,
                            style: AppStyles.styleMedium18(context)),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close))
                      ],
                    ),
                    const Gap(16),
                    _buildImagePair(
                      index1: 0,
                      index2: 1,
                      title: S.of(context).id_card,
                      subtitle1: 'امامى',
                      subtitle2: 'خلفى',
                    ),
                    const SizedBox(height: 16),
                    _buildImagePair(
                      index1: 2,
                      index2: 3,
                      title: S.of(context).driving_license,
                      subtitle1: 'امامى',
                      subtitle2: 'خلفى',
                    ),
                    const SizedBox(height: 16),
                    _buildImagePair(
                      index1: 4,
                      index2: 5,
                      title: S.of(context).scooter_license,
                      subtitle1: 'امامى',
                      subtitle2: 'خلفى',
                    ),
                    const SizedBox(height: 16),
                    _buildImage(
                      index1: 6,
                      title: S.of(context).birth_certificate,
                    ),
                    const SizedBox(height: 16),
                    _buildImage(
                      index1: 7,
                      title: S.of(context).criminal_record,
                    ),
                    const SizedBox(height: 16),
                    _buildImage(
                      index1: 8,
                      title: S.of(context).drug_test,
                    ),
                    if (state.hasError)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text(
                          state.errorText!,
                          style: AppStyles.styleMedium18(context)
                              .copyWith(color: pKcolor),
                        ),
                      ),
                    const SizedBox(height: 16),
                    CustomButton(
                      text: S.of(context).Continue,
                      txtcolor: Colors.white,
                      btncolor: pKcolor,
                      onPressed: () async {
                        if (key.currentState!.validate()) {
                          key.currentState!.save();
                          widget.textEditingController.text = " تم حفظ الملف";
                          Navigator.pop(context);
                        }
                      },
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildImagePair({
    required int index1,
    required int index2,
    required String title,
    required String subtitle1,
    required String subtitle2,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.styleMedium16(context)),
        const SizedBox(height: 10),
        Row(
          children: [
            _buildImageTile(index1, subtitle1),
            const SizedBox(width: 10),
            _buildImageTile(index2, subtitle2),
          ],
        ),
      ],
    );
  }

  Widget _buildImage({
    required int index1,
    required String title,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.styleMedium16(context)),
        const SizedBox(height: 10),
        Align(
            alignment: Alignment.center,
            child: _buildImageNoExpand(
              index1,
            )),
      ],
    );
  }

  Widget _buildImageTile(int index, String subtitle) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _pickImage(index),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      _driverPapers[index] != null ? Colors.green : Colors.grey,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: _driverPapers[index] != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        _driverPapers[index]!,
                        fit: BoxFit.cover,
                        height: AppSizes.getHeight(150, context),
                        width: AppSizes.getWidth(200, context),
                      ),
                    )
                  : const Icon(
                      Icons.camera_alt,
                      size: 50,
                      color: Colors.grey,
                    ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: AppStyles.styleMedium14(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageNoExpand(int index) {
    return GestureDetector(
      onTap: () => _pickImage(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        decoration: BoxDecoration(
          border: Border.all(
            color: _driverPapers[index] != null ? Colors.green : Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: _driverPapers[index] != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  _driverPapers[index]!,
                  fit: BoxFit.cover,
                  height: AppSizes.getHeight(150, context),
                  width: AppSizes.getWidth(200, context),
                ),
              )
            : const Icon(
                Icons.camera_alt,
                size: 50,
                color: Colors.grey,
              ),
      ),
    );
  }
}
