import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketPage.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/home_marts_model.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/resturantImgContainer.dart';

class PopularMartCard extends StatelessWidget {
  const PopularMartCard({
    super.key,
    required this.mart,
  });
  final HomeMartsModel mart;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // savePartnerId(id: '');

        NavigateToPage.slideFromRight(
            context: context,
            page: MarketPage(
              martName: mart.name!,
              martID: mart.id,
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
              MartImgContainer(img: mart.imageUrl!, id: mart.id!),
              const SizedBox(height: 16),
              Text(mart.name!, style: AppStyles.styleSemiBold16(context)),
              const SizedBox(height: 5),
              Text(mart.description!, style: AppStyles.styleRegular10(context)),
              const SizedBox(height: 4),
              MartRatingAndDeliveryTime(mart: mart),
            ],
          ),
        ),
      ),
    );
  }
}

class MartRatingAndDeliveryTime extends StatelessWidget {
  const MartRatingAndDeliveryTime({
    super.key,
    required this.mart,
  });

  final HomeMartsModel mart;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star_rate_rounded, color: Color(0xffFEC400), size: 18),
        const SizedBox(width: 4),
        Text(mart.rate.toString(), style: AppStyles.styleRegular10(context)),
        const SizedBox(width: 10),
        Image.asset(
          Assets.imagesMotorbike,
          width: AppSizes.getWidth(12, context),
          height: AppSizes.getWidth(12, context),
        ),
        const SizedBox(width: 4),
        Text(" ${mart.deliveryTime} min",
            style: AppStyles.styleRegular10(context))
      ],
    );
  }
}
