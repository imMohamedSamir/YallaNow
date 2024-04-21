import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';

class RecentPlacesCard extends StatelessWidget {
  const RecentPlacesCard({super.key, required this.recentPlacesCardModel});
  final RecentPlacesCardModel recentPlacesCardModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(43, context),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.titleHeight,
        contentPadding: EdgeInsets.zero,
        leading: const Icon(Icons.location_on_rounded, color: scColor),
        titleTextStyle:
            AppStyles.styleMedium16(context).copyWith(color: scColor),
        title: Text(recentPlacesCardModel.title),
        subtitle: Text(recentPlacesCardModel.subtitle),
        subtitleTextStyle: AppStyles.styleRegular12(context),
        trailing: Text(
          recentPlacesCardModel.distance,
          style: AppStyles.styleMedium14(context),
        ),
      ),
    );
  }
}

class RecentPlacesCardModel {
  final String title, subtitle, distance;

  RecentPlacesCardModel(
      {required this.title, required this.subtitle, required this.distance});
}
