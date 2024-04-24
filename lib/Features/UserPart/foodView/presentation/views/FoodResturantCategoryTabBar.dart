import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/DiscountSec.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/TrendingSec.dart';

class FoodResturantCategoryTabBar extends StatefulWidget {
  const FoodResturantCategoryTabBar({super.key});

  @override
  State<FoodResturantCategoryTabBar> createState() =>
      _FoodResturantCategoryTabBarState();
}

class _FoodResturantCategoryTabBarState
    extends State<FoodResturantCategoryTabBar> with TickerProviderStateMixin {
  late final TabController _tabController;
  List<String> categories = [
    'Trending',
    'Discount',
    'Sandwiches',
    'New Category'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);

    _tabController;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 1,
      child: DefaultTabController(
        length: categories.length,
        child: Column(
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
                          controller: _tabController,
                          tabAlignment: TabAlignment.start,
                          onTap: (value) {},
                          isScrollable: true,
                          tabs: categories.map((category) {
                            return Tab(
                              child: category == 'Trending'
                                  ? Row(
                                      children: [
                                        Text(
                                          category,
                                        ),
                                        const SizedBox(width: 4),
                                        Image.asset(
                                          Assets.imagesTrendingIcon,
                                          height:
                                              AppSizes.getHeight(16, context),
                                          width: AppSizes.getWidth(16, context),
                                        ),
                                      ],
                                    )
                                  : Text(
                                      category,
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: const <Widget>[
                    TrendingSec(),
                    DiscountSec(),
                    Center(
                      child: Text("sandwiches"),
                    ),
                    Center(
                      child: Text("It's rainy here"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
