import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class Genderdropmenu extends StatelessWidget {
  const Genderdropmenu({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      expandedInsets: EdgeInsets.zero,
      // menuStyle: MenuStyle(),
      inputDecorationTheme: InputDecorationTheme(
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
