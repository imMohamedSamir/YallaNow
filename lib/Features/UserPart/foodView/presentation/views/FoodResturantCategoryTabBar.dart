import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/resturant_branches_cubit/resturant_branches_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ResturantCateg.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ResturantPageLoading.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ResturantTabBar.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/TrendingSec.dart';

class FoodResturantCategoryTabBar extends StatefulWidget {
  const FoodResturantCategoryTabBar(
      {super.key,
      required this.scrollToIndex,
      required this.scrollController,
      required this.categKeys});
  final void Function(int index) scrollToIndex;
  final ScrollController scrollController;
  final List<GlobalKey> categKeys;
  @override
  State<FoodResturantCategoryTabBar> createState() =>
      _FoodResturantCategoryTabBarState();
}

class _FoodResturantCategoryTabBarState
    extends State<FoodResturantCategoryTabBar> {
  List<String> menus = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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

            hasProcessedMenus = true;
            return DefaultTabController(
              length: menus.length,
              child: Column(
                children: [
                  ResturantTabBar(
                    menus: menus,
                    scrollToIndex: (int index) => widget.scrollToIndex(index),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: <Widget>[
                          const TrendingSec(),
                          ...List.generate(
                              menus.length - 1,
                              (index) => ResturantCateg(
                                    items: state
                                        .branchDetails.menus![index].items!,
                                    name: state
                                        .branchDetails.menus![index].menuName!,
                                    categKey: widget.categKeys[index],
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
