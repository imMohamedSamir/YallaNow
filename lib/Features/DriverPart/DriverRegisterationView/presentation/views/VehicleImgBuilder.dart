import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/data/models/DrRegisterModel.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/manager/driver_registeration_cubit/driver_registeration_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

class VehicleImgBuilder extends StatefulWidget {
  const VehicleImgBuilder({super.key});

  @override
  _VehicleImgBuilderState createState() => _VehicleImgBuilderState();
}

class _VehicleImgBuilderState extends State<VehicleImgBuilder> {
  final List<File?> _vehicleImages = List<File?>.filled(4, null);
  final ImagePicker _picker = ImagePicker();
  late DriverRegisterModel driverDetails;
  Future<void> _pickImage(int index) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _vehicleImages[index] = File(image.path);
      });
    }
  }

  String? _validateImages(value) {
    if (_vehicleImages.any((img) => img == null)) {
      return S.of(context).vehicleImagesValidation;
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
  Widget build(BuildContext context) {
    return FormField(
      onSaved: (_) {
        if (_vehicleImages.isNotEmpty) {
          driverDetails.vehicleImg = _vehicleImages;
        }
      },
      validator: _validateImages,
      builder: (FormFieldState<String> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  state.errorText!,
                  style: const TextStyle(color: pKcolor),
                ),
              ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: _vehicleImages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _pickImage(index),
                  child: Container(
                    // padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: _vehicleImages[index] != null
                              ? Colors.green
                              : Colors.grey,
                          width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _vehicleImages[index] != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              _vehicleImages[index]!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const Icon(
                            Icons.camera_alt,
                            size: 50,
                            color: Colors.grey,
                          ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
