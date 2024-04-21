import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';

class CurrentLocationIcon extends StatelessWidget {
  const CurrentLocationIcon({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.white,
      padding: EdgeInsets.zero,
      height: AppSizes.getHeight(34, context),
      minWidth: AppSizes.getWidth(34, context),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: const BorderSide(color: Colors.white),
      ),
      onPressed: onPressed,
      child: SvgPicture.asset(
        Assets.imagesCurrentLocationIcon,
        height: AppSizes.getHeight(19, context),
        width: AppSizes.getWidth(19, context),
      ),
    );
  }
}
