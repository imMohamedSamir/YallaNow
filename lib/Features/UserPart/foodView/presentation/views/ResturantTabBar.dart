import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class ResturantTabBar extends StatelessWidget {
  const ResturantTabBar({
    super.key,
    required this.menus,
    required this.scrollToIndex,
  });

  final List<String> menus;
  final void Function(int index) scrollToIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.list)),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TabBar(
                      unselectedLabelStyle: AppStyles.styleMedium16(context)
                          .copyWith(color: const Color(0xff5A5A5A)),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: const Color(0xffB20404),
                      labelColor: const Color(0xffB20404),
                      labelStyle: AppStyles.styleSemiBold16(context)
                          .copyWith(color: const Color(0xff5A5A5A)),
                      tabAlignment: TabAlignment.start,
                      onTap: (index) => scrollToIndex(index),
                      isScrollable: true,
                      tabs: menus.map((menu) {
                        return Tab(
                          child: menu == 'Trending'
                              ? Row(
                                  children: [
                                    Text(
                                      menu,
                                    ),
                                    const SizedBox(width: 4),
                                    Image.asset(
                                      Assets.imagesTrendingIcon,
                                      height: AppSizes.getHeight(16, context),
                                      width: AppSizes.getWidth(16, context),
                                    ),
                                  ],
                                )
                              : Text(
                                  menu,
                                ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // void scrollToIndex(int index) async {
  //   scrollController.removeListener(animateToTab);
  //   final categories = jewelleryCategories[index].currentContext!;
  //   await Scrollable.ensureVisible(
  //     categories,
  //     duration: const Duration(milliseconds: 600),
  //   );
  //   scrollController.addListener(animateToTab);
  // }
}
