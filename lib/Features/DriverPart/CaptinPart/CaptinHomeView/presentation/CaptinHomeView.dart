import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/Manager/language_cubit/language_cubit.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/NotificationController.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/Repo/CaptinRequestRepoImpl.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/DriverBottomNavBar.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/CheckHomeAppBar.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/captin_ride_request_cubit/captin_ride_request_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/views/CaptinHomeViewBody.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/views/DriverCaptinDrawer.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinOrdersView/presentation/manager/captin_trips_cubit/captin_trips_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinOrdersView/presentation/views/CaptinOrdersViewBody.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/data/repo/CatpinProfileRepoImpl.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/presentation/manager/captin_drawer_cubit/captin_drawer_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRatingView/presentation/views/CaptinRatingView.dart';

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
    BlocProvider.of<LanguageCubit>(context).changeLanguage(arabicLoc);
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: (receivedAction) async {
        await BlocProvider.of<CaptinRideRequestCubit>(context)
            .handleReceivedRequest(context, action: receivedAction);
      },
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: (receivedAction) async {
        await BlocProvider.of<CaptinRideRequestCubit>(context)
            .onDismissAction(context, action: receivedAction);
      },
    );
    super.initState();
    _pageController = PageController(initialPage: currentPage);
    BlocProvider.of<CaptinRideRequestCubit>(context).checkLocationPermission();
    BlocProvider.of<CaptinRideRequestCubit>(context).initialize();
  }

  void setCurrentPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  List<Widget> pages = [
    const CaptinHomeViewBody(),
    const CaptinOrdersViewBody(),
    // const CaptinRatingView()
  ];
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CaptinDrawerCubit(getIt.get<CatpinProfileRepoImpl>())..get(),
        ),
        BlocProvider(
          create: (context) =>
              CaptinTripsCubit(getIt.get<CaptinRequestRepoImpl>())..get(),
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: currentPage == 1 ? const Color(0xffF5F5F5) : null,
        appBar: checkCaptinAppBar(context, currnetpage: currentPage),
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
        bottomNavigationBar: CaptinBottomNavBar(
          onItemTapped: setCurrentPage,
          currentIndex: currentPage,
        ),
      ),
    );
  }
}
