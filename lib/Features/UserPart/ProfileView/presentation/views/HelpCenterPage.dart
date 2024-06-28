import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/HelpCenterBody.dart';
import 'package:yallanow/generated/l10n.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: secondAppBar(context, title: S.of(context).HelpCenter),
      body: const HelpCenterBody(),
    );
  }
}
