import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ResturantHeaderIcon.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/FavIcon.dart';

class FoodResturantSecondAppBar extends StatelessWidget {
  const FoodResturantSecondAppBar({
    super.key,
    this.resturantName,
    required this.isTop,
    this.resturantImg,
  });
  final bool isTop;
  final String? resturantName, resturantImg;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 16),
      sliver: SliverAppBar(
        floating: true,
        titleSpacing: -4,
        pinned: true,
        expandedHeight: AppSizes.getHeight(150, context),
        flexibleSpace: FlexibleSpaceBar(
          background: Image.network(resturantImg!, fit: BoxFit.fill),
        ),
        leading: isTop
            ? FittedBox(
                fit: BoxFit.scaleDown,
                child: Container(
                  width: AppSizes.getWidth(32, context),
                  height: AppSizes.getHeight(32, context),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                      iconSize: 18,
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              )
            : IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: isTop ? Colors.white : null,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
        title: isTop
            ? null
            : Text(resturantName ?? "Burger lover",
                style: AppStyles.styleMedium18(context)
                    .copyWith(color: thirdcolor)),
        actions: [
          FavIcon(height: AppSizes.getHeight(32, context)),
          const SizedBox(width: 10),
          ResturantHeaderIcon(
            child: SvgPicture.asset(Assets.imagesShareIcon),
            onPressed: () {},
          ),
          const SizedBox(width: 10),
          ResturantHeaderIcon(
            child: SvgPicture.asset(
              Assets.imagesSearchIcon,
              colorFilter:
                  const ColorFilter.mode(Color(0xff240301), BlendMode.srcIn),
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 16)
        ],
      ),
    );
  }
}
