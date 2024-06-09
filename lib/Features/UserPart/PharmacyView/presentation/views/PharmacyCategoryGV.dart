import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/pharmacy_details_model/PharmacyItem.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyItemDetails.dart';

class PharmacyCategoryGV extends StatelessWidget {
  const PharmacyCategoryGV({super.key, required this.items});
  final List<PharmacyItem> items;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10, crossAxisSpacing: 16, crossAxisCount: 2),
      itemBuilder: (context, index) {
        return PharmacyItemDetails(item: items[index]);
      },
    );
  }
}
