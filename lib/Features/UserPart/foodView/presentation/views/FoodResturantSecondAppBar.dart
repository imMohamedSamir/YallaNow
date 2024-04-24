import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ResturantHeaderIcon.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/FavIcon.dart';

class FoodResturantSecondAppBar extends StatelessWidget {
  const FoodResturantSecondAppBar({
    super.key,
  });

  get height => null;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // snap: true,
      // floating: true,
      titleSpacing: -4,
      pinned: true,
      title: Text("Burger lover",
          style: AppStyles.styleMedium18(context).copyWith(color: thirdcolor)),
      leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          }),
      actions: [
        const FavIcon(),
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
    );
  }
}
