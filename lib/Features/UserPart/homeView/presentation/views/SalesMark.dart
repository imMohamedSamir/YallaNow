import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class SalesMark extends StatelessWidget {
  const SalesMark({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.34,
      height: width * 0.34 - 5,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(Assets.imagesSalesBG))),
      child: Transform(
        transform: Matrix4.identity()
          ..translate(1.0, 16.0)
          ..rotateZ(-0.72),
        child: Text(
          "SALE",
          style: AppStyles.styleBold12(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
