import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/data/models/DrRegisterModel.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/manager/driver_registeration_cubit/driver_registeration_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

class DriverPapersBuilder extends StatefulWidget {
  const DriverPapersBuilder({super.key, required this.textEditingController});
  final TextEditingController textEditingController;
  @override
  _DriverPapersBuilderState createState() => _DriverPapersBuilderState();
}

class _DriverPapersBuilderState extends State<DriverPapersBuilder> {
  final List<File?> _driverPapers = List<File?>.filled(9, null);
  final ImagePicker _picker = ImagePicker();
  late DriverRegisterModel driverDetails;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  Future<void> _pickImage(int index) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _driverPapers[index] = File(image.path);
      });
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
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: FormField(
        validator: _validateImages,
        onSaved: (_) {
          if (_driverPapers.isNotEmpty) {
            driverDetails.vehicleImg = _driverPapers;
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
                      text: S.of(context).Yalla,
                      txtcolor: Colors.white,
                      btncolor: pKcolor,
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          key.currentState!.save();
                          widget.textEditingController.text = " تم حفظ الملفات";
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
      child: Container(
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
