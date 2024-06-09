import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/PharmacyHealtModel.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyCategoryPage.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyHealthCard.dart';

class PharmacyHealthGV extends StatelessWidget {
  const PharmacyHealthGV({super.key});
  static List<PharmacyHealtModel> categories = [
    PharmacyHealtModel(title: "Cold & fever", img: Assets.imagesColdandfever),
    PharmacyHealtModel(
        title: "Blood Pressure", img: Assets.imagesBloodPressure),
    PharmacyHealtModel(title: "Cold & fever", img: Assets.imagesColdandfever),
    PharmacyHealtModel(
        title: "Blood Pressure", img: Assets.imagesBloodPressure),
    PharmacyHealtModel(title: "Cold & fever", img: Assets.imagesColdandfever),
    PharmacyHealtModel(
        title: "Blood Pressure", img: Assets.imagesBloodPressure),
    PharmacyHealtModel(title: "Cold & fever", img: Assets.imagesColdandfever),
    PharmacyHealtModel(
        title: "Blood Pressure", img: Assets.imagesBloodPressure),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 16,
        childAspectRatio: 78 / 150,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PharmacyCategoryPage(
                      title: categories[index].title,
                      items: [],
                    ),
                  ));
            },
            child: PharmacyHealthCard(pharmacyHealtModel: categories[index]));
      },
    );
  }
}
