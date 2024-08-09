import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:upgrader/upgrader.dart';
import 'package:yallanow/Core/utlis/geolocatorService.dart';
import 'package:yallanow/Features/UserPart/NotificationView/presentation/NotificationView.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/ProfileView.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/ScooterRideView.dart';
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
  late String version;
  late PackageInfo packageInfo;
  @override
  void initState() {
    app();
    Upgrader().initialize();
    LocationService().checkPermission(context);
    super.initState();
  }

  void app() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    log("${packageInfo.appName} \n${packageInfo.version}\n${packageInfo.buildNumber}");
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
