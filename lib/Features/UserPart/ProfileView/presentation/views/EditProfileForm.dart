import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/GenderDropMenu.dart';
import 'package:yallanow/Features/UserPart/ProfileView/data/models/user_profile_details.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/ChangeNumberButton.dart';

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
  bool readOnly = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Column(
        children: [
          CustomTextField(
              hintText: "",
              initialValue:
                  "${widget.userProfileDetails.firstName}  ${widget.userProfileDetails.lastName}"),
          const SizedBox(height: 16),
          CustomTextField(
              hintText: "", initialValue: "${widget.userProfileDetails.email}"),
          const SizedBox(height: 16),
          Genderdropmenu(initialvalue: "Male", onChanged: (value) {}),
          const SizedBox(height: 16),
          const CustomTextField(hintText: "", initialValue: "Address"),
          const SizedBox(height: 16),
          CustomTextField(
              readOnly: readOnly,
              hintText: "",
              initialValue: "${widget.userProfileDetails.phoneNumber}",
              suffixIcon: ChangeNumberButton(onTap: () {
                setState(() {
                  readOnly = !readOnly;
                });
              })),
          SizedBox(height: AppSizes.getHeight(65, context)),
          const CustomButton(
              text: "Save",
              txtcolor: Colors.white,
              btncolor: Color(0xffB20404)),
        ],
      ),
    );
  }
}
