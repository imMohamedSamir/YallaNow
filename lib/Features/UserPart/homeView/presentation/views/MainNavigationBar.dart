import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/generated/l10n.dart';

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({
    super.key,
    @required this.currentIndex,
    required this.onItemTapped,
  });
  final int? currentIndex;
  final void Function(int) onItemTapped;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 15,
        onTap: onItemTapped,
        currentIndex: currentIndex ?? 0,
        selectedItemColor: pKcolor,
        unselectedItemColor: const Color(0xff9E9D9D),
        selectedLabelStyle: AppStyles.styleMedium14(context),
        showUnselectedLabels: true,
        unselectedLabelStyle: AppStyles.styleMedium12(context)
            .copyWith(color: const Color(0xff9E9D9D)),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_rounded),
            label: S.of(context).Home,
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                currentIndex == 1
                    ? Assets.imagesActiveScooterIcon
                    : Assets.imagesScooterRideICon,
              ),
              label: S.of(context).scooterRide),
          // BottomNavigationBarItem(
          //     icon: SvgPicture.asset(
          //       currentIndex == 2
          //           ? Assets.imagesOrdersIconActive
          //           : Assets.imagesOrdersIcon,
          //     ),
          //     label: "Orders"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                currentIndex == 2
                    ? Assets.imagesNotificationsIconActive
                    : Assets.imagesNotificationsIcon,
              ),
              label: S.of(context).Notifications),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                currentIndex == 3
                    ? Assets.imagesProfileIconActive
                    : Assets.imagesProfileIcon,
              ),
              label: S.of(context).profile)
        ]);
  }
}
