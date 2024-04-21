import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyBestSellerLV.dart';

class PharmacyRelatedProductsSec extends StatelessWidget {
  const PharmacyRelatedProductsSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Related products", style: AppStyles.styleMedium16(context)),
        const SizedBox(height: 16),
        const PharmacyGeneralLV()
      ],
    );
  }
}
