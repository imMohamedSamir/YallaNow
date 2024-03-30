import 'package:flutter/material.dart';

class ResturantHeaderIcon extends StatelessWidget {
  const ResturantHeaderIcon({
    super.key,
    required this.width,
    this.onPressed,
    required this.child,
  });

  final double width;
  final void Function()? onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width * 0.085,
        height: width * 0.085,
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
