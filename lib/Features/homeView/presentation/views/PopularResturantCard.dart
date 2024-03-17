import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/homeView/data/Models/PopularResturanModel.dart';
import 'package:yallanow/Features/homeView/presentation/views/RatingAndDeliveryTime.dart';
import 'package:yallanow/Features/homeView/presentation/views/resturantImgContainer.dart';

class PopularResturantCard extends StatelessWidget {
  const PopularResturantCard({
    super.key,
    required this.hieght,
    required this.resturantModel,
  });

  final double hieght;
  final popularResturantModel resturantModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResturantImgContainer(
              hieght: hieght,
              img: resturantModel.img,
            ),
            const SizedBox(height: 16),
            Text(resturantModel.RestName,
                style: AppStyles.styleSemiBold16(context)),
            const SizedBox(height: 5),
            Text(resturantModel.Description,
                style: AppStyles.styleRegular10(context)),
            const SizedBox(height: 4),
            RatingAndDeliveryTime(
              resturantModel: resturantModel,
              hieght: hieght,
            ),
          ],
        ),
      ),
    );
  }
}
