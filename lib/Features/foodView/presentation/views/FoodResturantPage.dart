import 'package:flutter/material.dart';
import 'package:yallanow/Features/foodView/presentation/views/DiscountSec.dart';
import 'package:yallanow/Features/foodView/presentation/views/FoodBottomBar.dart';
import 'package:yallanow/Features/foodView/presentation/views/FoodResturantAppBar.dart';
import 'package:yallanow/Features/foodView/presentation/views/ResturantDescription.dart';
import 'package:yallanow/Features/foodView/presentation/views/TrendingSec.dart';

class FoodResturantPage extends StatelessWidget {
  const FoodResturantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
              padding: EdgeInsets.only(bottom: 16),
              sliver: SliverToBoxAdapter(child: FoodResturantAppBar())),
          SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(child: ResturantDescription())),
          SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(child: Divider(height: 26))),
          SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(child: TrendingSec())),
          SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(child: DiscountSec())),
        ],
      ),
      bottomNavigationBar: FoodBottomBar(),
    );
  }
}
