import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/resturant_branches_cubit/resturant_branches_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ResturantCateg.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ResturantPageLoading.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ResturantTabBar.dart';
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

  List<String> menus = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 1,
      child: BlocBuilder<ResturantBranchesCubit, ResturantBranchesState>(
        builder: (context, state) {
          if (state is ResturantBranchesSuccess) {
            menus.add("Trending");
            for (var menu in state.branchDetails.menus!) {
              menus.add(menu.menuName!);
            }
            _tabController = TabController(length: menus.length, vsync: this);

            return DefaultTabController(
              length: menus.length,
              child: Column(
                children: [
                  ResturantTabBar(tabController: _tabController, menus: menus),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _tabController,
                        children: <Widget>[
                          TrendingSec(),
                          ...List.generate(
                              menus.length - 1,
                              (index) => ResturantCateg(
                                    items: state
                                        .branchDetails.menus![index].items!,
                                    name: state
                                        .branchDetails.menus![index].menuName!,
                                  )),
                          // DiscountSec(),
                          // Center(
                          //   child: Text("sandwiches"),
                          // ),
                          // Center(
                          //   child: Text("It's rainy here"),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is ResturantBranchesLoading) {
            const ResturantPageLoading();
          }
          return const SizedBox();
        },
      ),
    );
  }
}
