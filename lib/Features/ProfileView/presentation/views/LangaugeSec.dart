import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Features/ProfileView/presentation/views/LanguageRadioLT.dart';

class LangaugeSec extends StatefulWidget {
  const LangaugeSec({
    super.key,
  });

  @override
  State<LangaugeSec> createState() => _LangaugeSecState();
}

class _LangaugeSecState extends State<LangaugeSec> {
  String? groupValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LanguageRadioLT(
          title: "English (US)",
          groupValue: groupValue,
          value: 'English',
          onChanged: (String? value) {
            setState(() {
              groupValue = value; // Update groupValue when user selects English
              context.setLocale(
                  const Locale('en', 'US')); // Change locale to English
            });
          },
        ),
        LanguageRadioLT(
          groupValue: groupValue,
          value: "Arabic",
          onChanged: (String? value) {
            setState(() {
              groupValue = value;
              context.setLocale(const Locale('ar'));
            });
          },
          title: "Arabic",
        )
      ],
    );
  }
}
