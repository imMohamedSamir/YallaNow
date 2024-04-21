import 'dart:math';
import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/PharmacyCategoryModel.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyCategoryCard.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyCategoryPage.dart';

class PharmacyCategoryLV extends StatelessWidget {
  const PharmacyCategoryLV({super.key});
  static List<PharmacyCategoryModel> categories = [
    PharmacyCategoryModel(name: "Medicine", img: Assets.imagesMedicin),
    PharmacyCategoryModel(name: "Body care", img: Assets.imagesCare),
    PharmacyCategoryModel(name: "Juhayna", img: Assets.imagesMedicin),
    PharmacyCategoryModel(name: "OXI", img: Assets.imagesCare),
    PharmacyCategoryModel(name: "Juhayna", img: Assets.imagesMedicin),
    PharmacyCategoryModel(name: "OXI", img: Assets.imagesCare)
  ];
  static List<Color> colors = [
    const Color(0xffFFEEEE),
    const Color(0xffFCE1EC),
    const Color(0xffF8D5E9),
    const Color(0xffF5C8E7),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(115, context),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          int randomColorIndex = Random().nextInt(colors.length);
          Color color = colors[randomColorIndex];
          return Padding(
            padding: EdgeInsets.only(
                right: index == categories.length - 1 ? 0 : 12.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PharmacyCategoryPage(
                        title: categories[index].name,
                      ),
                    ));
              },
              child: PharmacyCategoryCard(
                color: color,
                pharmacyCategoryModel: categories[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
