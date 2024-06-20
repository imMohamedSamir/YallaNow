import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/data/models/FavoriteCardModel.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketPage.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/pharmacy_model.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/manager/pharmacy_details_cubit/pharmacy_details_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/resturant_branches_cubit/resturant_branches_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodResturantPage.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/FavIcon.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard(
      {super.key, required this.favoriteCardModel, required this.partnerType});
  final FavoriteCardModel favoriteCardModel;
  final int partnerType;
  @override
  Widget build(BuildContext context) {
    String img = favoriteCardModel.img!.contains("wwwroot")
        ? "http://yallanow.runasp.net\\images\\1a8655d5-a4b6-4d49-b541-a4323a9bec99_download (1).jpg"
        : favoriteCardModel.img!;
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        _navigateToPage(context);
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
                    child: CachedNetworkImage(
                      imageUrl: img,
                      height: AppSizes.getHeight(100, context),
                      width: AppSizes.getWidth(100, context),
                      fit: BoxFit.fill,
                      errorWidget: (context, url, error) {
                        return const Icon(Icons.error_sharp, color: pKcolor);
                      },
                    )),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(favoriteCardModel.name ?? "",
                          style: AppStyles.styleSemiBold16(context)),
                      const SizedBox(height: 4),
                      Text(favoriteCardModel.description ?? "",
                          style: AppStyles.styleRegular10(context)),
                      const SizedBox(height: 4),
                      Row(children: [
                        Icon(Icons.star_rate_rounded,
                            color: const Color(0xffFEC400),
                            size: AppSizes.getWidth(12, context)),
                        const SizedBox(width: 4),
                        Text(favoriteCardModel.rating ?? "",
                            style: AppStyles.styleRegular10(context))
                      ]),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.access_time_rounded,
                              color: const Color(0xff5A5A5A),
                              size: AppSizes.getHeight(12, context)),
                          const SizedBox(width: 4),
                          Text("${favoriteCardModel.deliveryTime} min",
                              style: AppStyles.styleRegular10(context)),
                          const SizedBox(width: 18),
                          Image.asset(Assets.imagesMotorbike,
                              width: AppSizes.getWidth(12, context),
                              height: AppSizes.getHeight(12, context)),
                          const SizedBox(width: 4),
                          Text(favoriteCardModel.deliveryPrice ?? "",
                              style: AppStyles.styleRegular10(context)),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
                const FavIcon(favorite: true)
              ],
            )),
      ),
    );
  }

  void _navigateToPage(BuildContext context) {
    if (partnerType == resturantType) {
      BlocProvider.of<ResturantBranchesCubit>(context)
          .fetchResturantBranches(restaurantId: favoriteCardModel.id!);
      NavigateToPage.slideFromRight(
          context: context,
          page: FoodResturantPage(
            resurantName: favoriteCardModel.name,
            returantImg: favoriteCardModel.img,
            deliveryPrice: favoriteCardModel.deliveryPrice,
            deliveryTime: favoriteCardModel.deliveryTime,
          ));
    } else if (partnerType == marttType) {
      NavigateToPage.slideFromRight(
          context: context,
          page: MarketPage(
              martID: favoriteCardModel.id, martName: favoriteCardModel.name));
    } else {
      BlocProvider.of<PharmacyDetailsCubit>(context).getPharmacyDetails(context,
          pharmacyModel: PharmacyModel.fromFavoriteCard(favoriteCardModel));
    }
  }
}
