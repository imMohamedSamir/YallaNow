import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';

class TrackingOrderPageView extends StatelessWidget {
  const TrackingOrderPageView({super.key, required this.pageController});
  final PageController pageController;
  static List<Widget> views = [
    Image.asset(Assets.imagesOrderPlaced),
    Image.asset(Assets.imagesPreparingOrder),
    Image.asset(Assets.imagesDeliveredimg),
    Image.asset(Assets.imagesDeliveredimg)
  ];
  @override
  Widget build(BuildContext context) {
    return ExpandablePageView(
      controller: pageController,
      children: List.generate(4, (index) => views[index]),
    );
  }
}
