import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class Genderdropmenu extends StatelessWidget {
  const Genderdropmenu(
      {super.key,
      this.onChanged,
      this.errmsg,
      this.validator,
      this.initialvalue});
  final void Function(String?)? onChanged;
  final String? errmsg;
  final String? Function(String?)? validator;
  final String? initialvalue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      style: AppStyles.styleMedium16(context)
          .copyWith(color: const Color(0xff9E9D9D)),
      value: initialvalue,
      onChanged: onChanged,
      validator: validator,
      items: ['Male', 'Female'].map((String e) {
        return DropdownMenuItem<String>(
          value: e,
          child: initialvalue != null
              ? Text(e,
                  style: AppStyles.styleMedium16(context)
                      .copyWith(color: const Color(0xff9E9D9D)))
              : Text(e, style: AppStyles.styleMedium16(context)),
        );
      }).toList(),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xffB20404), width: 2)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xff9E9D9D))),
      ),
      hint: Text("Gender",
          style: AppStyles.styleMedium16(context)
              .copyWith(color: const Color(0xff9E9D9D))),
    );
  }
}
