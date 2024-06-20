import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/LangaugeSec.dart';
import 'package:yallanow/generated/l10n.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondAppBar(context, title: S.of(context).Language),
      body: const LangaugeSec(),
    );
  }
}
