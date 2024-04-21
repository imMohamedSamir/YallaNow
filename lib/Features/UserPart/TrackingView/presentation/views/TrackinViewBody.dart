import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/UserPart/TrackingView/presentation/views/TrackingBottomSheet.dart';
import 'package:yallanow/Features/UserPart/TrackingView/presentation/views/TrackingOrderPageView.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ResturantHeaderIcon.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/MainHomeView.dart';

class TrackinViewBody extends StatefulWidget {
  const TrackinViewBody({super.key});

  @override
  State<TrackinViewBody> createState() => _TrackinViewBodyState();
}

class _TrackinViewBodyState extends State<TrackinViewBody> {
  late PageController mainPageController;
  late PageController bottomSheetPageController;
  int carretnIndex = 0;

  @override
  void initState() {
    super.initState();
    mainPageController = PageController(initialPage: carretnIndex);
    bottomSheetPageController = PageController(initialPage: carretnIndex);

    startDelayedProcess();
  }

  @override
  void dispose() {
    mainPageController.dispose();
    bottomSheetPageController.dispose();
    super.dispose();
  }

  void startDelayedProcess() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      if (carretnIndex < 3) {
        carretnIndex++;
        mainPageController.animateToPage(carretnIndex,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
        bottomSheetPageController.animateToPage(carretnIndex,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
        startDelayedProcess();
      } else if (carretnIndex == 3) {
        carretnIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Stack(
        children: [
          TrackingOrderPageView(pageController: mainPageController),
          Align(
              alignment: Alignment.bottomCenter,
              child: TrackingBottomSheetSec(
                pageController: bottomSheetPageController,
                page: carretnIndex,
              )),
          Positioned(
            top: AppSizes.getHeight(55, context),
            left: 16,
            child: ResturantHeaderIcon(
              child: const Icon(Icons.close, size: 21),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainHomeView(),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
