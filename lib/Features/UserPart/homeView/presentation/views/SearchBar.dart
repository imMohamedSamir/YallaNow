import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacySearchPage.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodSearchPage.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/HomeSearchPage.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/MartSearchPage.dart';
import 'package:yallanow/generated/l10n.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(61, context),
      width: AppSizes.getWidth(361, context),
      child: Card(
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onTap: () {
            NavigateToPage.slideFromBottomAndFade(
                context: context, page: const HomeSearchPage());
          },
          leading: SvgPicture.asset(Assets.imagesSearchIcon),
          title: Text(
            S.of(context).Search,
            style: AppStyles.styleMedium16(context).copyWith(color: scColor),
          ),
        ),
      ),
    );
  }
}

class FoodSearchBar extends StatelessWidget {
  const FoodSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(61, context),
      width: AppSizes.getWidth(361, context),
      child: Card(
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onTap: () {
            NavigateToPage.slideFromBottomAndFade(
                context: context, page: const FoodSearchPage());
          },
          leading: SvgPicture.asset(Assets.imagesSearchIcon),
          title: Text(
            S.of(context).Search,
            style: AppStyles.styleMedium16(context).copyWith(color: scColor),
          ),
        ),
      ),
    );
  }
}

class PharmacySearchBar extends StatelessWidget {
  const PharmacySearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(61, context),
      width: AppSizes.getWidth(361, context),
      child: Card(
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onTap: () {
            NavigateToPage.slideFromBottomAndFade(
                context: context, page: const PharmacySearchPage());
          },
          leading: SvgPicture.asset(Assets.imagesSearchIcon),
          title: Text(
            S.of(context).Search,
            style: AppStyles.styleMedium16(context).copyWith(color: scColor),
          ),
        ),
      ),
    );
  }
}

class MartsSearchBar extends StatelessWidget {
  const MartsSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(61, context),
      width: AppSizes.getWidth(361, context),
      child: Card(
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onTap: () {
            NavigateToPage.slideFromBottomAndFade(
                context: context, page: const MartSearchPage());
          },
          leading: SvgPicture.asset(Assets.imagesSearchIcon),
          title: Text(
            S.of(context).Search,
            style: AppStyles.styleMedium16(context).copyWith(color: scColor),
          ),
        ),
      ),
    );
  }
}
