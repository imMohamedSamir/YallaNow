import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/homeView/presentation/views/EverydayRidesSec.dart';
import 'package:yallanow/Features/homeView/presentation/views/GrocerySec.dart';
import 'package:yallanow/Features/homeView/presentation/views/LocationAppBar.dart';
import 'package:yallanow/Features/homeView/presentation/views/SearchBar.dart';
import 'package:yallanow/Features/homeView/presentation/views/categorySec.dart';
import 'package:yallanow/Features/homeView/presentation/views/offersSec.dart';
import 'package:yallanow/Features/homeView/presentation/views/popularResturants.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const LocationAppBar(),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(top: 12),
              sliver: SliverToBoxAdapter(child: HomeSearchBar()),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 13),
              sliver: SliverToBoxAdapter(child: CategorySec()),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 24),
              sliver: SliverToBoxAdapter(child: OffersSec()),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 24),
              sliver: SliverToBoxAdapter(child: PopularResturansSec()),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 24),
              sliver: SliverToBoxAdapter(child: GrocerySec()),
            ),
            SliverToBoxAdapter(child: Expanded(child: SizedBox())),
            SliverPadding(
              padding: EdgeInsets.only(top: 24, bottom: 20),
              sliver: SliverToBoxAdapter(child: EverydayRidesSec()),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const HomeNavigationBar(),
    );
  }
}

class HomeNavigationBar extends StatefulWidget {
  const HomeNavigationBar({
    super.key,
  });

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  int currentIndex = 0;
  void _onItemTapped(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 15,
        onTap: _onItemTapped,
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
