import 'package:flutter/material.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryHomeView/presentation/DriverBottomNavBar.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryHomeView/presentation/manager/CheckHomeAppBar.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryHomeView/presentation/views/DeliverHomeViewBody.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryHomeView/presentation/views/DriverDrawer.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryOrdersView/presentation/views/DeliveyOrdersViewBody.dart';
import 'package:yallanow/Features/DriverPart/DeliveryRatingView/presentation/views/DeliveryRatingView.dart';

class DeliverHomeView extends StatefulWidget {
  const DeliverHomeView({super.key});

  @override
  State<DeliverHomeView> createState() => _DeliverHomeViewState();
}

class _DeliverHomeViewState extends State<DeliverHomeView> {
  int currentPage = 0;
  late PageController _pageController;
  @override
  void initState() {
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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  static List<Widget> pages = [
    const DeliverHomeViewBody(),
    const DeliveryOrdersView(),
    const DeliveryRatingView()
  ];
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
      drawer: const DriverDrawer(),
      bottomNavigationBar: DriverBottomNavBar(
        onItemTapped: setCurrentPage,
        currentIndex: currentPage,
      ),
    );
  }
}
