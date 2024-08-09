import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/top_categ_resturant.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodResturantPage.dart';
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
        // savePartnerId(id: popularResturants.id!, type: resturantType);
        NavigateToPage.slideFromRightAndFade(
            context: context,
            page: FoodResturantPage(
              id: popularResturants.id!,
              resurantName: popularResturants.name,
              deliveryTime: popularResturants.deliveryTime ?? "",
              deliveryPrice: "free",
              returantImg: popularResturants.imageUrl,
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
                img: popularResturants.imageUrl!,
                id: popularResturants.id!,
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
    required this.resturantModel,
  });

  final TopCategResturant resturantModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigateToPage.slideFromRightAndFade(
            context: context,
            page: FoodResturantPage(
              id: resturantModel.id!,
              resurantName: resturantModel.name,
              deliveryTime: resturantModel.deliverytime ?? "",
              deliveryPrice: "free",
              returantImg: resturantModel.imageUrl,
            ));
      },
      child: Card(
        elevation: 0.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RestFoodImgContainer(
              img: resturantModel.imageUrl ?? "",
              partnerId: resturantModel.id!,
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
                      Text(resturantModel.name ?? "",
                          style: AppStyles.styleSemiBold16(context)),
                      const SizedBox(height: 5),
                      Text(resturantModel.desc ?? "",
                          style: AppStyles.styleRegular10(context)),
                    ],
                  ),
                  const Spacer(),
                  const SizedBox(height: 4),
                  // RatingAndDeliveryTime(
                  //   resturantModel: resturantModel,
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 14),
          ],
        ),
      ),
    );
  }
}
