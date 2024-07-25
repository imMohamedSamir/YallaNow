import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class OBpageView extends StatelessWidget {
  const OBpageView({
    super.key,
    required this.pageController,
  });
  final PageController pageController;
  static const List<String> dsc = [
    "Discover new horizons",
    "Explore endless possibilities",
    "Unlock your potential",
    "Embark on a journey of self-discovery"
  ];
  static const List<String> pages = [
    Assets.imagesOB1,
    Assets.imagesOB2,
    Assets.imagesOB3,
    Assets.imagesOB4,
  ];
  @override
  Widget build(BuildContext context) {
    return ExpandablePageView(
      controller: pageController,
      scrollDirection: Axis.horizontal,
      children: List.generate(
          4,
          (index) => Stack(alignment: Alignment.center, children: [
                Image.asset(
                  Assets.imagesOnboarding1,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: AppSizes.getHeight(250, context),
                  child: Column(
                    children: [
                      Text("Enable your location",
                          style: AppStyles.styleMedium24(context)
                              .copyWith(color: Colors.white)),
                      const SizedBox(height: 12),
                      RichText(
                        text: TextSpan(
                            text: dsc[index],
                            style: AppStyles.styleMedium14(context)
                                .copyWith(color: Colors.white)),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              ])),
    );
  }
}
