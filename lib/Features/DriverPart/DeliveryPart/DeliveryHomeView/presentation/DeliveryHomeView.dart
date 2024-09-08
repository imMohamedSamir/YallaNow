import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/Manager/language_cubit/language_cubit.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/NotificationController.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/data/repo/CatpinProfileRepoImpl.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/presentation/manager/captin_drawer_cubit/captin_drawer_cubit.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryHomeView/presentation/DriverBottomNavBar.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryHomeView/presentation/manager/CheckDeliveryAppBar.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryHomeView/presentation/manager/delivery_request_cubit/delivery_request_cubit.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryHomeView/presentation/views/DeliverHomeViewBody.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryHomeView/presentation/views/DriverDrawer.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryOrdersView/presentation/views/DeliveyOrdersViewBody.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryRequestView/presentation/views/DeliveryRequestBS.dart';

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
    BlocProvider.of<LanguageCubit>(context).changeLanguage(arabicLoc);
    BlocProvider.of<DeliveryRequestCubit>(context).checkLocationPermission();
    BlocProvider.of<DeliveryRequestCubit>(context).initialize();
    //   AwesomeNotifications().setListeners(
    //   onActionReceivedMethod: (receivedAction) async {
    //     await BlocProvider.of<DeliveryRequestCubit>(context)
    //         .handleReceivedRequest(context, action: receivedAction);
    //   },
    //   onNotificationCreatedMethod:
    //       NotificationController.onNotificationCreatedMethod,
    //   onNotificationDisplayedMethod:
    //       NotificationController.onNotificationDisplayedMethod,
    //   onDismissActionReceivedMethod: (receivedAction) async {
    //     await BlocProvider.of<DeliveryRequestCubit>(context)
    //         .onDismissAction(context, action: receivedAction);
    //   },
    // );
    super.initState();
    _pageController = PageController(initialPage: currentPage);
  }

  void setCurrentPage(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  static List<Widget> pages = [
    const DeliverHomeViewBody(),
    const DeliveryOrdersView(),
    // const DeliveryRatingView()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CaptinDrawerCubit(getIt.get<CatpinProfileRepoImpl>())..get(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: currentPage == 1 ? const Color(0xffF5F5F5) : null,
        appBar: checkDeliveryAppBar(context, currnetpage: currentPage),
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
        // bottomSheet: DeliveryRequestBS(),
      ),
    );
  }
}
