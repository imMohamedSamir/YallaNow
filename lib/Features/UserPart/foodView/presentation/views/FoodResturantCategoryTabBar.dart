import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/resturant_branches_cubit/resturant_branches_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ResturantCateg.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ResturantPageLoading.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ResturantTabBar.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/TrendingSec.dart';

class FoodResturantCategoryTabBar extends StatefulWidget {
  const FoodResturantCategoryTabBar({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;
  @override
  State<FoodResturantCategoryTabBar> createState() =>
      _FoodResturantCategoryTabBarState();
}

class _FoodResturantCategoryTabBarState
    extends State<FoodResturantCategoryTabBar> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
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
      child: BlocBuilder<ResturantBranchesCubit, ResturantBranchesState>(
        builder: (context, state) {
          bool hasProcessedMenus = false;
          if (state is ResturantBranchesSuccess && !hasProcessedMenus) {
            final menus = <String>['Trending'];
            menus.addAll(state.branchDetails.menus!
                .map((menu) => menu.menuName!)
                .toList());
            _tabController = TabController(length: menus.length, vsync: this);

            hasProcessedMenus = true;
            return DefaultTabController(
              length: menus.length,
              child: Column(
                children: [
                  ResturantTabBar(menus: menus, tabController: _tabController),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _tabController,
                        children: <Widget>[
                          const TrendingSec(),
                          ...List.generate(
                              menus.length - 1,
                              (index) => ResturantCateg(
                                    items: state
                                        .branchDetails.menus![index].items!,
                                    name: state
                                        .branchDetails.menus![index].menuName!,
                                  )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is ResturantBranchesLoading) {
            return const ResturantPageLoading();
          }
          return const SizedBox();
        },
      ),
    );
  }
}
