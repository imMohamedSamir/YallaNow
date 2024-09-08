import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';

class ResturantTabBar extends StatelessWidget {
  const ResturantTabBar({
    super.key,
    required this.menus,
    required this.tabController,
  });
  final TabController tabController;
  final List<String> menus;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  _showCateg(context);
                },
                icon: const Icon(Icons.list)),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TabBar(
                      controller: tabController,
                      unselectedLabelStyle: AppStyles.styleMedium16(context)
                          .copyWith(color: const Color(0xff5A5A5A)),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: pKcolor,
                      labelColor: pKcolor,
                      labelStyle: AppStyles.styleSemiBold16(context)
                          .copyWith(color: const Color(0xff5A5A5A)),
                      tabAlignment: TabAlignment.start,
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

  void _showCateg(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(
                    menus.length,
                    (index) => ListTile(
                          onTap: () {
                            tabController.animateTo(index);
                            Navigator.pop(context);
                          },
                          title: Text(menus[index],
                              style: AppStyles.styleMedium16(context)),
                          trailing: menus[index] == "Trending"
                              ? Image.asset(
                                  Assets.imagesTrendingIcon,
                                  height: AppSizes.getHeight(20, context),
                                  width: AppSizes.getWidth(20, context),
                                )
                              : null,
                        ))
              ],
            ),
          );
        });
  }
}
