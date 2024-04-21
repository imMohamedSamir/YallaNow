import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodResturantPage.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/PopularResturanModel.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/popular_resturants.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/RatingAndDeliveryTime.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/resturantImgContainer.dart';

class PopularResturantCard extends StatelessWidget {
  const PopularResturantCard({
    super.key,
    required this.popularResturants,
  });
  // final popularResturant resturantModel;
  final PopularResturants popularResturants;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FoodResturantPage(),
            ));
      },
      child: Card(
        elevation: 0.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ResturantImgContainer(
                img: "",
              ),
              const SizedBox(height: 16),
              Text(popularResturants.name!,
                  style: AppStyles.styleSemiBold16(context)),
              const SizedBox(height: 5),
              Text(popularResturants.description!,
                  style: AppStyles.styleRegular10(context)),
              const SizedBox(height: 4),
              RatingAndDeliveryTime(popularResturants: popularResturants),
            ],
          ),
        ),
      ),
    );
  }
}

class RestFoodCard extends StatelessWidget {
  const RestFoodCard({
    super.key,
    required this.hieght,
    required this.resturantModel,
    required this.width,
  });
  final double hieght;
  final double width;
  final popularResturant resturantModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RestFoodImgContainer(
            hieght: hieght,
            img: resturantModel.img,
            width: width,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(resturantModel.RestName,
                        style: AppStyles.styleSemiBold16(context)),
                    const SizedBox(height: 5),
                    Text(resturantModel.Description,
                        style: AppStyles.styleRegular10(context)),
                  ],
                ),
                const Spacer(),
                // const SizedBox(height: 4),
                // RatingAndDeliveryTime(
                //   resturantModel: resturantModel,
                // ),
              ],
            ),
          ),
          const SizedBox(height: 14),
        ],
      ),
    );
  }
}
