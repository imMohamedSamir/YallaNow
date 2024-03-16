import 'package:flutter/material.dart';
import 'package:yallanow/Features/homeView/presentation/views/DotsIndicators.dart';
import 'package:yallanow/Features/homeView/presentation/views/OffersPageView.dart';

class OffersSec extends StatefulWidget {
  const OffersSec({super.key});

  @override
  State<OffersSec> createState() => _OffersSecState();
}

class _OffersSecState extends State<OffersSec> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OffresPageView(
          pageController: pageController,
        ),
        dotIndicatorgroup(currentIndex: currentPage),
      ],
    );
  }
}
