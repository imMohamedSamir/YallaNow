import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyBestSellerLV.dart';

class PahrmacyBestsellerSec extends StatelessWidget {
  const PahrmacyBestsellerSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Best seller", style: AppStyles.styleMedium16(context)),
        const SizedBox(height: 16),
        const PharmacyGeneralLV(),
      ],
    );
  }
}
