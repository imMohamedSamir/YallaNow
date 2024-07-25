import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/generated/l10n.dart';

class Genderdropmenu extends StatelessWidget {
  const Genderdropmenu(
      {super.key,
      this.onChanged,
      this.errmsg,
      this.validator,
      this.initialvalue,
      this.onSaved,
      this.enabled = false});
  final void Function(String?)? onChanged;
  final String? errmsg;
  final String? Function(String?)? validator;
  final String? initialvalue;
  final void Function(String?)? onSaved;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      style: AppStyles.styleMedium16(context)
          .copyWith(color: const Color(0xff9E9D9D)),
      value: initialvalue?.toLowerCase(),
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator,
      items: enabled!
          ? [S.of(context).Male, S.of(context).Female].map((String e) {
              return DropdownMenuItem<String>(
                // enabled: enabled ?? true,
                value: getGender(gender: e) ?? e.toLowerCase(),
                child: initialvalue != null
                    ? Text(e,
                        style: AppStyles.styleMedium16(context)
                            .copyWith(color: const Color(0xff9E9D9D)))
                    : Text(e, style: AppStyles.styleMedium16(context)),
              );
            }).toList()
          : [],
      decoration: InputDecoration(
        enabled: enabled ?? true,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: pKcolor, width: 2)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xff9E9D9D))),
      ),
      hint: Text(
          enabled!
              ? S.of(context).gender
              : getGenderFromEn(gender: initialvalue ?? ""),
          style: AppStyles.styleMedium16(context)
              .copyWith(color: const Color(0xff9E9D9D))),
    );
  }
}

getGender({required String gender}) {
  if (gender == "ذكر") {
    return "male";
  } else if (gender == "انثى") {
    return "female";
  } else {}
}

getGenderFromEn({required String gender}) {
  if (gender == "male" || gender == "Male") {
    return "ذكر";
  } else if (gender == "female" || gender == "Female") {
    return "انثى";
  } else {
    return null;
  }
}
