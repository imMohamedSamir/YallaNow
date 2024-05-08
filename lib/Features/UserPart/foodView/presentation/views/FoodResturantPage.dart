import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/manager/resturant_branches_cubit/resturant_branches_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodBottomBar.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodResturantCategoryTabBar.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodResturantSecondAppBar.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ResturantDescription.dart';

class FoodResturantPage extends StatefulWidget {
  const FoodResturantPage(
      {Key? key,
      this.deliveryTime,
      this.deliveryPrice,
      this.resurantName,
      this.returantImg})
      : super(key: key);
  final String? deliveryTime, deliveryPrice, resurantName, returantImg;
  @override
  State<FoodResturantPage> createState() => _FoodResturantPageState();
}

class _FoodResturantPageState extends State<FoodResturantPage>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  BuildContext? tabContext;
  List<GlobalKey> categories = [];

  bool isTop = true;
  @override
  void initState() {
    getDetail();
    _scrollController = ScrollController();
    update();
    super.initState();
  }

  void update() {
    _scrollController.addListener(() {
      if (_scrollController.offset > kToolbarHeight + 5) {
        setState(() {
          isTop = false;
        });
      } else {
        setState(() {
          isTop = true;
        });
      }
    });
  }

  void getDetail() {
    log("done");
    categories.add(GlobalKey());
    BlocListener<ResturantBranchesCubit, ResturantBranchesState>(
      listener: (context, state) {
        if (state is ResturantBranchesSuccess) {
          int menus = state.branchDetails.menus!.length;
          for (var i = 0; i < menus; i++) {
            categories.add(GlobalKey());
          }
        }
      },
    );
  }

  void scrollToIndex(int index, {List<GlobalKey>? category}) async {
    log(index.toString());
    _scrollController.removeListener(animateToTab);
    if (category!.isNotEmpty) {
      final categories = category[index].currentContext!;
      await Scrollable.ensureVisible(
        categories,
        duration: const Duration(milliseconds: 600),
      );
    }
    _scrollController.addListener(animateToTab);
  }

  void animateToTab() {
    late RenderBox box;

    for (var i = 0; i < categories.length; i++) {
      box = categories[i].currentContext!.findRenderObject() as RenderBox;
      Offset position = box.localToGlobal(Offset.zero);

      if (_scrollController.offset >= position.dy) {
        DefaultTabController.of(tabContext!).animateTo(
          i,
          duration: const Duration(milliseconds: 100),
        );
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        controller: _scrollController,
        slivers: <Widget>[
          FoodResturantSecondAppBar(
            isTop: isTop,
            resturantName: widget.resurantName,
            resturantImg: widget.returantImg,
          ),
          SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                  child: ResturantDescription(
                      deliveryPrice: widget.deliveryPrice,
                      deliveryTime: widget.deliveryTime))),
          SliverToBoxAdapter(
              child: FoodResturantCategoryTabBar(
            scrollToIndex: (int index) => scrollToIndex(index),
            scrollController: _scrollController,
            categKeys: categories,
          )),
        ],
      ),
      bottomNavigationBar: const FoodBottomBar(),
    );
  }
}
