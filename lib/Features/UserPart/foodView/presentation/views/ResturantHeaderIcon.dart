import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';

class ResturantHeaderIcon extends StatelessWidget {
  const ResturantHeaderIcon({
    super.key,
    this.onPressed,
    required this.child,
  });

  final void Function()? onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: AppSizes.getWidth(32, context),
        height: AppSizes.getHeight(32, context),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: InkWell(
          onTap: onPressed,
          child: Center(child: child),
        ));
  }
}
