import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppLang.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onSaved,
    this.suffixIcon,
    this.secure,
    this.onChanged,
    this.initialValue,
    this.readOnly,
    this.prefixIcon,
    this.onTap,
    this.maxLines,
    this.suffixIconConstraints,
    this.controller,
  });
  final String hintText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final bool? secure;
  final String? initialValue;
  final BoxConstraints? suffixIconConstraints;
  final bool? readOnly;
  final Widget? prefixIcon;
  final void Function()? onTap;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      readOnly: readOnly ?? false,
      // enabled: enabled,
      style: AppStyles.styleMedium16(context)
          .copyWith(color: const Color(0xff240301)),
      initialValue: initialValue,
      obscureText: secure ?? false,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        suffixIconConstraints: suffixIconConstraints,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: scColor, width: 2.5)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xff9E9D9D))),
        hintText: hintText,
        hintStyle: AppStyles.styleMedium16(context)
            .copyWith(color: const Color(0xff9E9D9D)),
        contentPadding: EdgeInsets.only(
            left: AppLang.isArabic() ? 0 : 20,
            top: 18,
            bottom: 18,
            right: AppLang.isArabic() ? 20 : 0),
      ),
    );
  }
}

// class CustomFormTextField extends StatelessWidget {
//   const CustomFormTextField({
//     Key? key,
//     required this.hintText,
//     this.keyboardType,
//     this.textInputAction,
//     this.validator,
//     this.onSaved,
//     this.suffixIcon,
//     this.secure,
//     this.onChanged,
//     this.initialValue,
//     this.readOnly,
//     this.prefixIcon,
//     this.onTap,
//     this.maxLines,
//     this.suffixIconConstraints,
//     this.controller,
//     required this.name,
//   }) : super(key: key);
//   final String name;
//   final String hintText;
//   final TextInputType? keyboardType;
//   final int? maxLines;
//   final TextInputAction? textInputAction;
//   final FormFieldValidator<String>? validator;
//   final FormFieldSetter<String>? onSaved;
//   final void Function(String?)? onChanged;
//   final Widget? suffixIcon;
//   final bool? secure;
//   final String? initialValue;
//   final BoxConstraints? suffixIconConstraints;
//   final bool? readOnly;
//   final Widget? prefixIcon;
//   final VoidCallback? onTap;
//   final TextEditingController? controller;

//   @override
//   Widget build(BuildContext context) {
//     return FormBuilderTextField(
//       name: name,
//       controller: controller,
//       onTap: onTap,
//       readOnly: readOnly ?? false,
//       keyboardType: keyboardType,
//       textInputAction: textInputAction,
//       initialValue: initialValue,
//       obscureText: secure ?? false,
//       onChanged: onChanged,
//       onSaved: onSaved,
//       validator: validator,
//       maxLines: maxLines,
//       style: AppStyles.styleMedium16(context)
//           .copyWith(color: const Color(0xff240301)),
//       decoration: InputDecoration(
//         suffixIconConstraints: suffixIconConstraints,
//         suffixIcon: suffixIcon,
//         prefixIcon: prefixIcon,
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: const BorderSide(color: scColor, width: 2.5)),
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: const BorderSide(color: Color(0xff9E9D9D))),
//         hintText: hintText,
//         hintStyle: AppStyles.styleMedium16(context)
//             .copyWith(color: const Color(0xff9E9D9D)),
//         contentPadding: EdgeInsets.only(
//             left: AppLang.isArabic() ? 0 : 20,
//             top: 18,
//             bottom: 18,
//             right: AppLang.isArabic() ? 20 : 0),
//       ),
//     );
//   }
// }
