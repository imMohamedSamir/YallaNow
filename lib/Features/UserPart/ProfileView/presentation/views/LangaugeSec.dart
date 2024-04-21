import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/LanguageRadioLT.dart';

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
              // Change locale to English
            });
          },
        ),
        LanguageRadioLT(
          groupValue: groupValue,
          value: "Arabic",
          onChanged: (String? value) {
            setState(() {
              groupValue = value;
            });
          },
          title: "Arabic",
        )
      ],
    );
  }
}
