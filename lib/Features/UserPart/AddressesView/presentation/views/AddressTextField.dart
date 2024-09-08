import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';

class AddressTextField extends StatelessWidget {
  const AddressTextField(
      {super.key,
      required this.hintText,
      this.keyboardType,
      this.maxLength,
      this.textInputAction,
      this.validator,
      this.onSaved,
      this.onChanged,
      this.suffixIcon,
      this.secure,
      this.initialValue,
      this.readOnly,
      this.prefixIcon,
      this.onTap,
      this.onTapOutside,
      required this.textEditingController,
      this.onFieldSubmitted});
  final String hintText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final bool? secure;
  final String? initialValue;
  final bool? readOnly;
  final Widget? prefixIcon;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      controller: textEditingController,
      onTap: onTap,
      readOnly: readOnly ?? false,
      // enabled: enabled,
      style: AppStyles.styleMedium16(context).copyWith(color: Colors.grey[700]),
      initialValue: initialValue,
      obscureText: secure ?? false,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      maxLength: maxLength,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onTapOutside: onTapOutside,

      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white, width: 2)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: scColor, width: 2)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white)),
        hintText: hintText,
        hintStyle: AppStyles.styleMedium16(context)
            .copyWith(color: const Color(0xff9E9D9D)),
        contentPadding: const EdgeInsets.only(left: 20, top: 16, bottom: 16),
      ),
    );
  }
}
