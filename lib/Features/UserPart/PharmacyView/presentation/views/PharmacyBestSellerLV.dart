import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyItemDetails.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyItemPage.dart';

class PharmacyGeneralLV extends StatelessWidget {
  const PharmacyGeneralLV({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(203, context),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index == 9 ? 0 : 12.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PharmacyItemPage()));
                },
                child: const PharmacyItemDetails()),
          );
        },
      ),
    );
  }
}
