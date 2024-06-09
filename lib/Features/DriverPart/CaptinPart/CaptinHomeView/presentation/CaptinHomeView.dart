import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:yallanow/Core/utlis/NotificationController.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/views/CaptinHomeViewBody.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/views/DriverCaptinDrawer.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinOrdersView/presentation/views/CaptinOrdersViewBody.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRatingView/presentation/views/CaptinRatingView.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryHomeView/presentation/DriverBottomNavBar.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryHomeView/presentation/manager/CheckHomeAppBar.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryOrdersView/presentation/views/DeliveyOrdersViewBody.dart';
import 'package:yallanow/Features/DriverPart/DeliveryRatingView/presentation/views/DeliveryRatingView.dart';

class CaptinHomeView extends StatefulWidget {
  const CaptinHomeView({super.key});

  @override
  State<CaptinHomeView> createState() => _CaptinHomeViewState();
}

class _CaptinHomeViewState extends State<CaptinHomeView> {
  int currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod);
    super.initState();
    _pageController = PageController(initialPage: currentPage);
  }

  void setCurrentPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  List<Widget> pages = [
    const CaptinHomeViewBody(),
    const CaptinOrdersViewBody(),
    const CaptinRatingView()
  ];
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentPage == 1 ? const Color(0xffF5F5F5) : null,
      appBar: checkAppBar(context, currnetpage: currentPage),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        children: pages,
      ),
      drawer: const DriverCaptinDrawer(),
      bottomNavigationBar: DriverBottomNavBar(
        onItemTapped: setCurrentPage,
        currentIndex: currentPage,
      ),
    );
  }
}
