import 'package:flutter/material.dart';
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
  ScrollController? _scrollController;
  bool isTop = true;
  @override
  void initState() {
    _scrollController = ScrollController();
    update();
    super.initState();
  }

  void update() {
    _scrollController!.addListener(() {
      if (_scrollController!.offset > kToolbarHeight + 5) {
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
          const SliverToBoxAdapter(child: FoodResturantCategoryTabBar()),
        ],
      ),
      bottomNavigationBar: const FoodBottomBar(),
    );
  }
}
