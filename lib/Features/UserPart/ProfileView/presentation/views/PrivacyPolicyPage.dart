import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/PrivacyPolicyPageBody.dart';
import 'package:yallanow/generated/l10n.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondAppBar(context, title: S.of(context).PrivacyPolicy),
      body: const PrivacyPolicyPageBody(),
    );
  }
}
