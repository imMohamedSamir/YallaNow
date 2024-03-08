import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class Genderdropmenu extends StatelessWidget {
  const Genderdropmenu({super.key, this.onSelected, this.errmsg});
  final void Function(String?)? onSelected;
  final String? errmsg;
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      onSelected: onSelected,
      expandedInsets: EdgeInsets.zero,
      // menuStyle: MenuStyle(),
      inputDecorationTheme: InputDecorationTheme(
          errorStyle:
              AppStyles.styleMedium12(context).copyWith(color: Colors.red),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
      hintText: "Gender",
      dropdownMenuEntries:
          ['Male', 'Female'].map<DropdownMenuEntry<String>>((e) {
        return DropdownMenuEntry<String>(
            value: e,
            labelWidget: Text(e, style: AppStyles.styleMedium16(context)),
            label: e);
      }).toList(),
    );
  }
}

// class DropdownMenuFormField extends FormField<String> {
//   DropdownMenuFormField({
//     Key? key,
//     required List<String> dropdownMenuEntries,
//     String? initialValue,
//     FormFieldValidator<String>? validator,
//     InputDecoration? decoration,
//     ValueChanged<String>? onChanged,
//   }) : super(
//           key: key,
//           initialValue: initialValue,
//           validator: validator,
//           builder: (FormFieldState<String> field) {
//             final InputDecoration effectiveDecoration = (decoration ??
//                     const InputDecoration())
//                 .applyDefaults(Theme.of(field.context).inputDecorationTheme);
//             return DropdownMenu(
//               expandedInsets: EdgeInsets.zero,
//               hintText: effectiveDecoration.hintText,
//               dropdownMenuEntries:
//                   dropdownMenuEntries.map<DropdownMenuEntry<String>>((e) {
//                 return DropdownMenuEntry<String>(
//                     value: e,
//                     labelWidget:
//                         Text(e, style: AppStyles.styleMedium16(field.context)),
//                     label: e);
//               }).toList(),
//             );
//           },
//         );
// }
