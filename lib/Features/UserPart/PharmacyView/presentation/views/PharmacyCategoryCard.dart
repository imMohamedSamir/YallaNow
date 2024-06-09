import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/pharmacy_details_model/pharmacy_details_model.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyCategoryPage.dart';

class PharmacyCategoryCard extends StatelessWidget {
  const PharmacyCategoryCard(
      {super.key, required this.categ, required this.color});
  final PharmacyDetailsModel categ;
  final Color color;
  @override
  Widget build(BuildContext context) {
    String url = categ.icon!.replaceAll('\\', '/');
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PharmacyCategoryPage(
                title: categ.name!,
                items: categ.items!,
              ),
            ));
      },
      child: Column(children: [
        Container(
          alignment: Alignment.bottomCenter,
          width: AppSizes.getWidth(60, context),
          height: AppSizes.getHeight(60, context),
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Center(
            child: ClipOval(
              child: Image.network(
                url,
                height: AppSizes.getHeight(50, context),
                width: AppSizes.getWidth(50, context),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          categ.name!,
          style: AppStyles.styleMedium14(context)
              .copyWith(color: const Color(0xff424242)),
        )
      ]),
    );
  }
}
