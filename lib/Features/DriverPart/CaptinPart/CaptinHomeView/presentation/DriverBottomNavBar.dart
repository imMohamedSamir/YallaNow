import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/generated/l10n.dart';

class DriverBottomNavBar extends StatelessWidget {
  const DriverBottomNavBar(
      {super.key, this.currentIndex, required this.onItemTapped});
  final int? currentIndex;
  final void Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 15,
        onTap: onItemTapped,
        currentIndex: currentIndex ?? 0,
        selectedItemColor: const Color(0xffB20404),
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
                    ? Assets.imagesOrdersIconActive
                    : Assets.imagesOrdersIcon,
              ),
              label: "Orders"),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.star_rounded,
              size: 26,
              // color: currentIndex == 2 ? Color(0xffFEC400) : Colors.grey,
            ),
            label: "Ratings",
          )
        ]);
  }
}
