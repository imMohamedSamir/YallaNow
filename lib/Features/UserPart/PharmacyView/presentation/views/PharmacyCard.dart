import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/data/models/add_fav_model.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/pharmacy_model.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/manager/pharmacy_details_cubit/pharmacy_details_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/FavIcon.dart';

class PharmacyCard extends StatelessWidget {
  const PharmacyCard({super.key, required this.pharmacyModel});
  final PharmacyModel pharmacyModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(32),
      onTap: () {
        if (pharmacyModel.id != null) {
          BlocProvider.of<PharmacyDetailsCubit>(context)
              .getPharmacyDetails(context, pharmacyModel: pharmacyModel);
        }
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
                  child: Image.asset(Assets.imagesPharmacy1,
                      height: AppSizes.getHeight(100, context),
                      width: AppSizes.getWidth(100, context),
                      fit: BoxFit.fill),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(pharmacyModel.name!,
                          style: AppStyles.styleSemiBold16(context)),
                      const SizedBox(height: 4),
                      Text(pharmacyModel.describtion!,
                          style: AppStyles.styleRegular12(context)),
                      const SizedBox(height: 4),
                      Row(children: [
                        Icon(Icons.star_rate_rounded,
                            color: const Color(0xffFEC400),
                            size: AppSizes.getWidth(12, context)),
                        const SizedBox(width: 4),
                        Text(pharmacyModel.rate.toString(),
                            style: AppStyles.styleRegular10(context))
                      ]),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.access_time_rounded,
                              color: const Color(0xff5A5A5A),
                              size: AppSizes.getHeight(12, context)),
                          const SizedBox(width: 4),
                          Text("${pharmacyModel.deliveryTime} min",
                              style: AppStyles.styleRegular10(context)),
                          const SizedBox(width: 18),
                          Image.asset(Assets.imagesMotorbike,
                              width: AppSizes.getWidth(12, context),
                              height: AppSizes.getHeight(12, context)),
                          const SizedBox(width: 4),
                          Text("${pharmacyModel.deliveryFees} EGP",
                              style: AppStyles.styleRegular10(context)),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
                FavIcon(addFavModel: createAddFavModel(pharmacyModel.id!))
              ],
            )),
      ),
    );
  }

  AddFavModel createAddFavModel(String id) {
    return AddFavModel(partnerId: id, partnerType: pharmacyType);
  }
}
