import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });
  final int currentIndex;
  final void Function(int) onItemTapped;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 15,
        onTap: onItemTapped,
        currentIndex: currentIndex,
        selectedItemColor: const Color(0xffB20404),
        unselectedItemColor: const Color(0xff9E9D9D),
        selectedLabelStyle: AppStyles.styleMedium14(context),
        showUnselectedLabels: true,
        unselectedLabelStyle: AppStyles.styleMedium12(context)
            .copyWith(color: const Color(0xff9E9D9D)),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.imagesScooterRideICon,
                colorFilter: ColorFilter.mode(
                    currentIndex == 1
                        ? const Color(0xffB20404)
                        : const Color(0xff9E9D9D),
                    BlendMode.srcIn),
              ),
              label: """Scooter
    Ride"""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.imagesOrdersIcon,
                colorFilter: ColorFilter.mode(
                    currentIndex == 2
                        ? const Color(0xffB20404)
                        : const Color(0xff9E9D9D),
                    BlendMode.srcIn),
              ),
              label: "Orders"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.imagesNotificationsIcon,
                colorFilter: ColorFilter.mode(
                    currentIndex == 3
                        ? const Color(0xffB20404)
                        : const Color(0xff9E9D9D),
                    BlendMode.srcIn),
              ),
              label: "Notifications"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.imagesProfileIcon,
                colorFilter: ColorFilter.mode(
                    currentIndex == 4
                        ? const Color(0xffB20404)
                        : const Color(0xff9E9D9D),
                    BlendMode.srcIn),
              ),
              label: "profile")
        ]);
  }
}
