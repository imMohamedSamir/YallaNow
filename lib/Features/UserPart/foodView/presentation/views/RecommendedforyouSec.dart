import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class RecommendedforyouSec extends StatelessWidget {
  const RecommendedforyouSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Recommended for you", style: AppStyles.styleMedium16(context)),
        // PopularResturansLV(
        //   popularResturans: popularResturans,
        // )
      ],
    );
  }
}
