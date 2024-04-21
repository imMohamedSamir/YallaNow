import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';

class ResultsPlacesCard extends StatelessWidget {
  const ResultsPlacesCard({super.key, required this.address, this.onTap});
  final String address;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListTile(
        onTap: onTap,
        // titleAlignment: ListTileTitleAlignment.titleHeight,
        contentPadding: EdgeInsets.zero,
        leading: const Icon(Icons.location_on_rounded, color: scColor),
        titleTextStyle:
            AppStyles.styleMedium16(context).copyWith(color: scColor),
        title: Text(address),
        // subtitle: Text(recentPlacesCardModel.subtitle),
        subtitleTextStyle: AppStyles.styleRegular12(context),
      ),
    );
  }
}
