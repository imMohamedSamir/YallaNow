import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class OffresPageView extends StatelessWidget {
  const OffresPageView(
      {super.key, required this.pageController, required this.offers});
  final PageController pageController;
  final List<OfferDetailsModel> offers;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(140, context),
      width: double.infinity,
      child: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: List.generate(
            4,
            (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AspectRatio(
                    aspectRatio: 361 / 140,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding:
                          const EdgeInsets.only(left: 16, top: 16, bottom: 0),
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              alignment: Alignment.centerRight,
                              image: AssetImage(Assets.imagesLogoImg)),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xffF44336), Color(0xffB20404)],
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(offers[index].title,
                                    style: AppStyles.styleBold32(context)),
                                Text(offers[index].subtitle,
                                    style: AppStyles.styleSemiBold16(context)
                                        .copyWith(color: Colors.white)),
                                SizedBox(
                                  width: AppSizes.getWidth(190, context),
                                  child: Text(offers[index].description,
                                      style: AppStyles.styleRegular12(context)
                                          .copyWith(color: Colors.white)),
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

class OfferDetailsModel {
  final String title, subtitle, description, img;

  OfferDetailsModel(
      {required this.title,
      required this.subtitle,
      required this.description,
      required this.img});
}
