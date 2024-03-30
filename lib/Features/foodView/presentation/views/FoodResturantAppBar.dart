import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/foodView/presentation/views/ResturantHeaderIcon.dart';
import 'package:yallanow/Features/homeView/presentation/views/FavIcon.dart';

class FoodResturantAppBar extends StatelessWidget {
  const FoodResturantAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height * 0.242;
    return Container(
        padding: const EdgeInsets.only(top: 55, left: 16),
        width: width,
        height: height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.imagesFoodItemImg), fit: BoxFit.fill)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResturantHeaderIcon(
                onPressed: () {
                  Navigator.pop(context);
                },
                width: width,
                child: const Icon(Icons.arrow_back_ios_new_rounded, size: 21)),
            const Spacer(),
            favIcon(height: height * 0.18),
            const SizedBox(width: 10),
            ResturantHeaderIcon(
              width: width,
              child: SvgPicture.asset(Assets.imagesShareIcon),
              onPressed: () {},
            ),
            const SizedBox(width: 10),
            ResturantHeaderIcon(
              width: width,
              child: SvgPicture.asset(
                Assets.imagesSearchIcon,
                colorFilter:
                    const ColorFilter.mode(Color(0xff240301), BlendMode.srcIn),
              ),
              onPressed: () {},
            ),
            const SizedBox(width: 16)
          ],
        ));
  }
}
