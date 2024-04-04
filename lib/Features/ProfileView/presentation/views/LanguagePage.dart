import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/ProfileView/presentation/views/LangaugeSec.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondAppBar(context,
          title: "Language".tr(args: ['aissat', 'Flutter'])),
      body: const LangaugeSec(),
    );
  }
}
