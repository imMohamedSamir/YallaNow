import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';

class ProfileEditIcon extends StatelessWidget {
  const ProfileEditIcon({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: AppSizes.getHeight(6, context),
        left: AppSizes.getWidth(100, context),
        child: Container(
            width: AppSizes.getWidth(30, context),
            height: AppSizes.getHeight(30, context),
            decoration: BoxDecoration(
                color: pKcolor, borderRadius: BorderRadius.circular(8)),
            child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: onPressed,
                icon: const Icon(Icons.edit, size: 18, color: Colors.white))));
  }
}
