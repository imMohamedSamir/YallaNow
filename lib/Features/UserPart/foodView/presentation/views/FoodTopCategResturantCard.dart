import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/top_categ_resturant.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodResturantPage.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/FavIcon.dart';

class FoodTopCategResturantCard extends StatelessWidget {
  const FoodTopCategResturantCard({super.key, required this.resturant});
  final TopCategResturant resturant;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigateToPage.slideFromRightAndFade(
            context: context,
            page: FoodResturantPage(
              id: resturant.id!,
              deliveryPrice: "free",
              deliveryTime: resturant.deliverytime!,
            ));
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
                  child: Image.network(resturant.imageUrl ?? "",
                      height: AppSizes.getHeight(100, context),
                      width: AppSizes.getWidth(100, context),
                      fit: BoxFit.fill),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(resturant.name!,
                          style: AppStyles.styleSemiBold16(context)),
                      const SizedBox(height: 4),
                      Text(resturant.desc!,
                          style: AppStyles.styleRegular10(context)),
                      const SizedBox(height: 4),
                      Row(children: [
                        Icon(Icons.star_rate_rounded,
                            color: const Color(0xffFEC400),
                            size: AppSizes.getWidth(12, context)),
                        const SizedBox(width: 4),
                        Text(resturant.rate.toString(),
                            style: AppStyles.styleRegular10(context))
                      ]),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.access_time_rounded,
                              color: const Color(0xff5A5A5A),
                              size: AppSizes.getHeight(12, context)),
                          const SizedBox(width: 4),
                          Text("${resturant.deliverytime} min",
                              style: AppStyles.styleRegular10(context)),
                          const SizedBox(width: 18),
                          Image.asset(Assets.imagesMotorbike,
                              width: AppSizes.getWidth(12, context),
                              height: AppSizes.getHeight(12, context)),
                          const SizedBox(width: 4),
                          Text("free",
                              style: AppStyles.styleRegular10(context)),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
                const FavIcon()
              ],
            )),
      ),
    );
  }
}
