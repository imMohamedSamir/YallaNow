import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/marts_model.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/manager/mart_details_cubit/mart_details_cubit.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/MarketPage.dart';
import 'package:yallanow/main.dart';

class SuperMarketCard extends StatelessWidget {
  const SuperMarketCard({super.key, required this.martsModel});
  final MartsModel martsModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(92, context),
      child: ListTile(
        onTap: () {
          BlocProvider.of<MartDetailsCubit>(context)
              .getMartsDetails(martID: martsModel.id!);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MarketPage(
                  martName: martsModel.name!,
                ),
              ));
        },
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            Assets.imagesSupermarket1,
            height: AppSizes.getHeight(60, context),
            width: AppSizes.getWidth(60, context),
            fit: BoxFit.cover,
          ),
        ),
        title: Text(martsModel.name ?? '',
            style: AppStyles.styleSemiBold16(context)),
        subtitle: Row(
          children: [
            Icon(Icons.access_time_rounded,
                color: const Color(0xff5A5A5A),
                size: AppSizes.getHeight(12, context)),
            const SizedBox(width: 4),
            Text("${martsModel.deliveryTime} min",
                style: AppStyles.styleRegular10(context)),
            const SizedBox(width: 18),
            Image.asset(
              Assets.imagesMotorbike,
              width: AppSizes.getWidth(12, context),
              height: AppSizes.getHeight(12, context),
            ),
            const SizedBox(width: 4),
            Text(martsModel.deliveryFees.toString(),
                style: AppStyles.styleRegular10(context)),
            const Spacer(),
            Icon(
              Icons.star_rate_rounded,
              color: const Color(0xffFEC400),
              size: AppSizes.getWidth(12, context),
            ),
            const SizedBox(width: 4),
            Text(martsModel.rate.toString(),
                style: AppStyles.styleRegular10(context)),
          ],
        ),
      ),
    );
  }
}
