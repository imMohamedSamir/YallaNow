import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/PharmacyView/data/models/PharmacyModel.dart';
import 'package:yallanow/main.dart';

class PharmacyCard extends StatelessWidget {
  const PharmacyCard({super.key, required this.pharmacyModel});
  final PharmacyModel pharmacyModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routesNames.pharmacy);
      },
      child: SizedBox(
        height: AppSizes.getHeight(100, context),
        child: Card(
            elevation: .2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(pharmacyModel.img,
                      height: AppSizes.getHeight(100, context),
                      width: AppSizes.getWidth(100, context),
                      fit: BoxFit.fill),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pharmacyModel.name,
                        style: AppStyles.styleSemiBold16(context),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        pharmacyModel.description,
                        style: AppStyles.styleRegular10(context),
                      ),
                      const SizedBox(height: 4),
                      Row(children: [
                        Icon(
                          Icons.star_rate_rounded,
                          color: const Color(0xffFEC400),
                          size: AppSizes.getWidth(12, context),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          pharmacyModel.rating,
                          style: AppStyles.styleRegular10(context),
                        )
                      ]),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            color: const Color(0xff5A5A5A),
                            size: AppSizes.getHeight(12, context),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "${pharmacyModel.deliveryTime} min",
                            style: AppStyles.styleRegular10(context),
                          ),
                          const SizedBox(width: 18),
                          Image.asset(
                            Assets.imagesMotorbike,
                            width: AppSizes.getWidth(12, context),
                            height: AppSizes.getHeight(12, context),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            pharmacyModel.deliveryPrice,
                            style: AppStyles.styleRegular10(context),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
