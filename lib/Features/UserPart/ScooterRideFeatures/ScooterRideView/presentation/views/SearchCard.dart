import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';

import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/views/ScooterSearchPage.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(61, context),
      width: AppSizes.getWidth(361, context),
      child: Card(
        child: ListTile(
          onTap: () {
            showModalBottomSheet(
              constraints: const BoxConstraints.expand(),
              context: context,
              isScrollControlled: true,
              enableDrag: true,
              showDragHandle: true,
              builder: (context) {
                return const ScooterSearchPage();
              },
            );
          },
          leading: SvgPicture.asset(Assets.imagesSearchIcon),
          title: Text(
            "Where to?",
            style: AppStyles.styleBold18(context).copyWith(color: scColor),
          ),
        ),
      ),
    );
  }
}
