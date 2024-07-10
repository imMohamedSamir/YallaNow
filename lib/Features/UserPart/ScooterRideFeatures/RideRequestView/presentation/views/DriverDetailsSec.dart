import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';

class DriverDetailsSec extends StatelessWidget {
  const DriverDetailsSec({
    super.key,
    required this.name,
    required this.rating,
    required this.imag,
  });
  final String name, rating, imag;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Image.network(imag,
              height: AppSizes.getHeight(40, context),
              width: AppSizes.getWidth(40, context),
              fit: BoxFit.cover),
        ),
        const SizedBox(width: 12),
        Text(name,
            style: AppStyles.styleRegular14(context).copyWith(color: scColor)),
        const Spacer(),
        const Icon(Icons.star_rounded, color: Color(0xffFEC400), size: 14),
        const SizedBox(width: 4),
        Text(rating, style: AppStyles.styleRegular12(context)),
        const SizedBox(width: 4),
        Text("(Top rated)", style: AppStyles.styleRegular12(context))
      ],
    );
  }
}
