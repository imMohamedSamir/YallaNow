import 'package:flutter/material.dart';
import 'package:yallanow/Features/homeView/presentation/views/DotsIndicators.dart';
import 'package:yallanow/Features/homeView/presentation/views/OffersPageView.dart';

class OffersSec extends StatefulWidget {
  const OffersSec({super.key, required this.offers, this.color1, this.color2});
  final List<OfferDetailsModel> offers;
  final Color? color1, color2;
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
          offers: widget.offers,
          color1: widget.color1,
          color2: widget.color2,
        ),
        const SizedBox(height: 16),
        dotIndicatorgroup(currentIndex: currentPage),
      ],
    );
  }
}
