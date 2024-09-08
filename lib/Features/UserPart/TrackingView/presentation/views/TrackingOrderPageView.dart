import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';

class TrackingOrderPageView extends StatelessWidget {
  const TrackingOrderPageView({super.key, required this.pageController});
  final PageController pageController;
  static List<String> views = [
    Assets.imagesOrderPlaced,
    Assets.imagesPreparingOrder,
    Assets.imagesDeliveredimg,
    Assets.imagesDeliveredimg
  ];
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: List.generate(
          views.length,
          (index) => Image.asset(
                alignment: Alignment.topCenter,
                views[index],
              )),
    );
  }
}
