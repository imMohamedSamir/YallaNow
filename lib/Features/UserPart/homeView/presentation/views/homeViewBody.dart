import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/OrdersView/presentation/OredersView.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/ProfileView.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/ScooterRideView.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/HomePage.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/MainNavigationBar.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/NotificationPage.dart';

class MainHomeViewBody extends StatefulWidget {
  const MainHomeViewBody({Key? key}) : super(key: key);

  @override
  _MainHomeViewBodyState createState() => _MainHomeViewBodyState();
}

class _MainHomeViewBodyState extends State<MainHomeViewBody> {
  int currentPage = 0;

  void setCurrentPage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  static List<Widget> pages = [
    const HomePage(),
    const ScooterRideView(),
    const OrdersView(),
    const NotificationPage(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: MainNavigationBar(
        currentIndex: currentPage,
        onItemTapped: setCurrentPage,
      ),
    );
  }
}
