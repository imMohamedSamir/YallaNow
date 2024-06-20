import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripsPopularPageView.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/DotsIndicators.dart';

class TripsPopularSec extends StatefulWidget {
  const TripsPopularSec({super.key});

  @override
  State<TripsPopularSec> createState() => _TripsPopularSecState();
}

class _TripsPopularSecState extends State<TripsPopularSec> {
  late ScrollController scrollController;
  int currentIndex = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    currentIndex = 0; // Initialize currentIndex

    timer = Timer.periodic(const Duration(seconds: 3), _scrollToNextIndex);

    scrollController.addListener(_updateCurrentIndex);
  }

  void _scrollToNextIndex(Timer timer) {
    if (!scrollController.hasClients) return;

    double maxScrollOffset = scrollController.position.maxScrollExtent;
    double itemWidth = maxScrollOffset / (4 - 1); // Assuming 4 items

    if (scrollController.hasClients) {
      currentIndex = (currentIndex + 1) % 4; // Update currentIndex cyclically

      double newScrollOffset = currentIndex * itemWidth;
      scrollController.animateTo(
        newScrollOffset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _updateCurrentIndex() {
    if (!scrollController.hasClients) return;

    double maxScrollOffset = scrollController.position.maxScrollExtent;
    double scrollOffset = scrollController.offset;
    int newIndex = ((scrollOffset / maxScrollOffset) * (4 - 1)).round();
    if (newIndex != currentIndex) {
      setState(() {
        currentIndex = newIndex;
      });
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TripsPopularLV(
          scrollController: scrollController,
        ),
        const Gap(12),
        dotIndicatorgroup(currentIndex: currentIndex)
      ],
    );
  }
}
