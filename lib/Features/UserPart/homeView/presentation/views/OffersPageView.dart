import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppLang.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/OfferDetailsModel.dart';

class OffresPageView extends StatelessWidget {
  const OffresPageView(
      {super.key,
      required this.pageController,
      required this.offers,
      this.color1,
      this.color2});
  final PageController pageController;
  final List<OfferDetailsModel> offers;
  final Color? color1, color2;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(140, context),
      width: double.infinity,
      child: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: List.generate(
            offers.length,
            (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AspectRatio(
                    aspectRatio: 361 / 140,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                          left: AppLang.isArabic() ? 0 : 16,
                          right: AppLang.isArabic() ? 16 : 0,
                          top: 16,
                          bottom: 0),
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              alignment: Alignment.centerRight,
                              image: AssetImage(Assets.imagesLogoImg)),
                          gradient: LinearGradient(
                            begin: color1 != null
                                ? Alignment.topCenter
                                : Alignment.topLeft,
                            end: color1 != null
                                ? Alignment.bottomCenter
                                : Alignment.bottomRight,
                            colors: [
                              color1 ?? const Color(0xffF44336),
                              color2 ?? const Color(0xffB20404)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(offers[index].title,
                                    style: AppStyles.styleBold32(context)
                                        .copyWith(
                                            color: color1 != null
                                                ? const Color(0xff240301)
                                                : null)),
                                Text(offers[index].subtitle,
                                    style: AppStyles.styleSemiBold16(context)
                                        .copyWith(
                                            color: color1 != null
                                                ? const Color(0xff240301)
                                                : Colors.white)),
                                SizedBox(
                                  width: AppSizes.getWidth(190, context),
                                  child: Text(offers[index].description,
                                      style: AppStyles.styleRegular12(context)
                                          .copyWith(
                                              color: color1 != null
                                                  ? const Color(0xff240301)
                                                  : Colors.white)),
                                )
                              ]),
                          Expanded(
                            child: Image.asset(
                              offers[index].img,
                              alignment: Alignment.bottomCenter,
                              fit: BoxFit.contain,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}
