import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';
import 'package:yallanow/Core/utlis/AppLang.dart';
import 'package:yallanow/Features/UserPart/NotificationView/presentation/NotificationView.dart';
import 'package:yallanow/Features/UserPart/OrdersView/presentation/OredersView.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/ProfileView.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/ScooterRideView.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/TripsVew.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/HomePage.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/MainNavigationBar.dart';

class MainHomeViewBody extends StatefulWidget {
  const MainHomeViewBody({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainHomeViewBodyState createState() => _MainHomeViewBodyState();
}

class _MainHomeViewBodyState extends State<MainHomeViewBody> {
  int currentPage = 0;
  @override
  void initState() {
    getToken();
    super.initState();
  }

  getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      log(token!);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setCurrentPage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  UpgraderMessages _upgraderMessages() {
    UpgraderMessages upgraderMessage =
        UpgraderMessages(code: AppLang.isArabic() ? 'ar' : "en");
    return upgraderMessage;
  }

  Upgrader _upgrader() {
    return Upgrader(
        countryCode: "EG",
        languageCode: AppLang.isArabic() ? 'ar' : "en",
        messages: _upgraderMessages(),
        debugLogging: true,
        debugDisplayOnce: true,
        minAppVersion: "1.0.1");
  }

  static List<Widget> pages = [
    const HomePage(),
    const ScooterRideView(fromHome: false),
    // const OrdersView(),
    const NotificationPage(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: MainNavigationBar(
          currentIndex: currentPage, onItemTapped: setCurrentPage),
      resizeToAvoidBottomInset: false,
    );
  }
}
