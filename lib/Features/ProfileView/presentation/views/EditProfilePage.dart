import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/ProfileView/presentation/views/EditProfileBody.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondAppBar(context, title: "Edit profile"),
      body: const EditProfileBody(),
    );
  }
}
