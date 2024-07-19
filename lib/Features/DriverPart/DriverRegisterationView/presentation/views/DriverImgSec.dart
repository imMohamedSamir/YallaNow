import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/data/models/DrRegisterModel.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/manager/DriverFileMangement.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/manager/driver_registeration_cubit/driver_registeration_cubit.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/ProfileEditIcon.dart';
import 'package:yallanow/generated/l10n.dart';

class DriverImgSec extends StatefulWidget {
  const DriverImgSec({super.key, this.netImg});
  final String? netImg;
  @override
  State<DriverImgSec> createState() => _DriverImgSecState();
}

class _DriverImgSecState extends State<DriverImgSec> {
  File? img;
  late DriverRegisterModel driverDetails;

  String? _validateImg(File? r) {
    if (img == null) {
      return S.of(context).SelectDriverImgValidation;
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
        validator: _validateImg,
        builder: (FormFieldState<String> state) {
          return Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  if (img != null)
                    ClipOval(
                      child: Image.file(
                        img!,
                        width: AppSizes.getWidth(130, context),
                        height: AppSizes.getHeight(130, context),
                        fit: BoxFit.cover,
                      ),
                    )
                  else if (widget.netImg != null)
                    ClipOval(
                      child: Image.network(
                        widget.netImg!,
                        width: AppSizes.getWidth(130, context),
                        height: AppSizes.getHeight(130, context),
                        fit: BoxFit.cover,
                      ),
                    )
                  else
                    Container(
                      width: AppSizes.getWidth(130, context),
                      height: AppSizes.getHeight(130, context),
                      decoration: BoxDecoration(
                          color: const Color(0xffFCD19C).withOpacity(0.9),
                          shape: BoxShape.circle),
                      child: const Center(child: Icon(Icons.image, size: 32)),
                    ),
                  ProfileEditIcon(
                    onPressed: () async {
                      img = await DriverFileMangement().pickImageFromgallery();
                      driverDetails.driverImg = img;
                      setState(() {});
                    },
                  ),
                ],
              ),
              if (state.hasError)
                Column(
                  children: [
                    const Gap(8),
                    Text(state.errorText!,
                        style: const TextStyle(color: pKcolor))
                  ],
                ),
            ],
          );
        });
  }
}
