import 'package:flutter/material.dart';
import 'package:yallanow/Features/OrdersView/presentation/OredersView.dart';
import 'package:yallanow/Features/ProfileView/presentation/ProfileView.dart';
import 'package:yallanow/Features/homeView/presentation/views/HomePage.dart';
import 'package:yallanow/Features/homeView/presentation/views/MainNavigationBar.dart';
import 'package:yallanow/Features/homeView/presentation/views/NotificationPage.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  _HomeViewBodyState createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int currentPage = 0;

  void setCurrentPage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  static List<Widget> pages = [
    const HomePage(),
    const SizedBox(),
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
