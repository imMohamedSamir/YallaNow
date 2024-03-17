import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/homeView/presentation/views/PopularResturansLV.dart';

class PopularResturansSec extends StatelessWidget {
  const PopularResturansSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Popular restaurant", style: AppStyles.styleMedium16(context)),
        const PopularResturansLV()
      ],
    );
  }
}
