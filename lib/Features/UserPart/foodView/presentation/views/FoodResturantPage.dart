import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/DiscountSec.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodBottomBar.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodResturantAppBar.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ResturantDescription.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/TrendingSec.dart';

class FoodResturantPage extends StatefulWidget {
  const FoodResturantPage({Key? key}) : super(key: key);

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
      if (_scrollController!.offset > 150) {
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
        controller: _scrollController,
        slivers: <Widget>[
          isTop
              ? const SliverPadding(
                  padding: EdgeInsets.only(bottom: 16),
                  sliver: SliverToBoxAdapter(
                    child: FoodResturantAppBar(),
                  ))
              : SliverAppBar(
                  // snap: true,
                  floating: true,
                  pinned: true,
                  title: const Text("Burger lover"),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
          const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(child: ResturantDescription())),
          const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(child: Divider(height: 26))),
          const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(child: TrendingSec())),
          const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(child: DiscountSec())),
        ],
      ),
      bottomNavigationBar: const FoodBottomBar(),
    );
  }
}

// SliverPersistentHeaderDelegate implementation for the second app bar
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
