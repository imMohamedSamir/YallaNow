import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yallanow/Features/ProfileView/presentation/views/EditProfileForm.dart';
import 'package:yallanow/Features/ProfileView/presentation/views/ProfileImgSec.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProfileImgSec(name: "Mohamed"),
          SizedBox(height: 34),
          EditProfileForm(),
        ],
      ),
    );
  }
}
