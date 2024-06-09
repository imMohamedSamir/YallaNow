import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ResturantHeaderIcon.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/FavIcon.dart';

class PharmacyAppBar extends StatelessWidget {
  const PharmacyAppBar({super.key, required this.imgUrl});
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 55, left: 16),
        width: double.infinity,
        height: AppSizes.getHeight(200, context),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.imagesPharmacyOffer),
                fit: BoxFit.fill)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResturantHeaderIcon(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios_new_rounded, size: 21)),
            const Spacer(),
            FavIcon(height: AppSizes.getHeight(32, context)),
            const SizedBox(width: 10),
            ResturantHeaderIcon(
              child: SvgPicture.asset(Assets.imagesShareIcon),
              onPressed: () {},
            ),
            const SizedBox(width: 10),
            ResturantHeaderIcon(
              child: SvgPicture.asset(Assets.imagesSearchIcon,
                  colorFilter: const ColorFilter.mode(
                      Color(0xff240301), BlendMode.srcIn)),
              onPressed: () {},
            ),
            const SizedBox(width: 16)
          ],
        ));
  }
}
