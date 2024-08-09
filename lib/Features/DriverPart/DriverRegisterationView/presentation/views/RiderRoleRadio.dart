import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';

enum RiderRole { delivery, captin }

class RiderRoleRadio extends StatelessWidget {
  const RiderRoleRadio(
      {super.key,
      this.value,
      this.groupValue,
      this.onChanged,
      required this.title,
      required this.icon});
  final value, groupValue;
  final void Function(dynamic)? onChanged;
  final String title, icon;
  @override
  Widget build(BuildContext context) {
    return RadioListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        activeColor: pKcolor,
        tileColor: grayColor,
        selectedTileColor: pKcolor,
        contentPadding: EdgeInsets.zero,
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppStyles.styleMedium16(context)),
            const Spacer(),
            Image.asset(
              icon,
              height: AppSizes.getHeight(20, context),
              width: AppSizes.getWidth(20, context),
              fit: BoxFit.fill,
              color: pKcolor,
              colorBlendMode: BlendMode.srcIn,
            ),
            const SizedBox(width: 16),
          ],
        ));
  }
}
