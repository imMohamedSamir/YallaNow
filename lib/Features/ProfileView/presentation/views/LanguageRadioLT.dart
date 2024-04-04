import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class LanguageRadioLT extends StatelessWidget {
  const LanguageRadioLT({
    super.key,
    required this.groupValue,
    this.onChanged,
    required this.value,
    this.title,
  });
  final String? groupValue, value, title;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      controlAffinity: ListTileControlAffinity.trailing,
      activeColor: const Color(0xffB20404),
      value: value!,
      groupValue: groupValue,
      onChanged: onChanged,
      title: Text(
        title!,
        style: AppStyles.styleMedium18(context)
            .copyWith(color: const Color(0xff5A5A5A)),
      ),
    );
  }
}
