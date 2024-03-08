import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';

class OBpageView extends StatelessWidget {
  const OBpageView({
    super.key,
    required this.pageController,
  });
  final PageController pageController;
  static const List<String> pages = [
    Assets.imagesOB1,
    Assets.imagesOB2,
    Assets.imagesOB3,
    Assets.imagesOB4,
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ExpandablePageView(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          children: List.generate(4, (index) => Image.asset(pages[index])),
        ));
  }
}
