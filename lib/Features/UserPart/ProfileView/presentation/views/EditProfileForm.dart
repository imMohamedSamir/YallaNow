import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/GenderDropMenu.dart';
import 'package:yallanow/Features/UserPart/ProfileView/data/models/user_profile_details.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/manager/edit_user_details_cubit/edit_user_details_cubit.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/ChangeNumberButton.dart';
import 'package:yallanow/generated/l10n.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({
    super.key,
    required this.userProfileDetails,
  });
  final UserProfileDetails userProfileDetails;

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  late EditUserDetailsCubit cubit;
  bool readOnly = true;

  @override
  void initState() {
    cubit = BlocProvider.of<EditUserDetailsCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Form(
        key: cubit.key,
        child: Column(
          children: [
            CustomTextField(
              hintText: "",
              initialValue:
                  "${widget.userProfileDetails.firstName} ${widget.userProfileDetails.lastName}",
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return S.of(context).firstnameValidation;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: S.of(context).Email,
              initialValue: "${widget.userProfileDetails.email}",
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return S.of(context).MailValidation;
                }
                if (!value.contains("@")) {
                  return S.of(context).correctEmail;
                }
                return null;
              },
              onSaved: (value) {},
            ),
            const SizedBox(height: 16),
            Genderdropmenu(
              initialvalue: "Male",
              onChanged: (value) {},
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return S.of(context).GenderValidation;
                }
                return null;
              },
              onSaved: (value) {},
            ),
            const SizedBox(height: 16),
            // const CustomTextField(hintText: "", initialValue: "Address"),
            // const SizedBox(height: 16),
            CustomTextField(
              readOnly: readOnly,
              hintText: "",
              initialValue: "${widget.userProfileDetails.phoneNumber}",
              suffixIcon: ChangeNumberButton(onTap: () {
                setState(() {
                  readOnly = !readOnly;
                });
              }),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return S.of(context).PhoneValidation;
                }
                return null;
              },
            ),
            SizedBox(height: AppSizes.getHeight(65, context)),
            const EditBtnBuilder(),
          ],
        ),
      ),
    );
  }
}

class EditBtnBuilder extends StatelessWidget {
  const EditBtnBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "Save",
      txtcolor: Colors.white,
      btncolor: pKcolor,
      onPressed: () {
        BlocProvider.of<EditUserDetailsCubit>(context).edit();
      },
    );
  }
}
