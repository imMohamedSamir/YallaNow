import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/pharmacy_details_model/PharmacyItem.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyCategoryGV.dart';

class PharmacyCategoryGVSec extends StatelessWidget {
  const PharmacyCategoryGVSec(
      {super.key, required this.title, required this.items});
  final String title;
  final List<PharmacyItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(title, style: AppStyles.styleMedium16(context)),
        // const SizedBox(height: 16),
        PharmacyCategoryGV(items: items)
      ],
    );
  }
}
