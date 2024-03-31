import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yallanow/Features/foodView/presentation/views/DiscountSec.dart';
import 'package:yallanow/Features/foodView/presentation/views/FoodBottomBar.dart';
import 'package:yallanow/Features/foodView/presentation/views/FoodResturantAppBar.dart';
import 'package:yallanow/Features/foodView/presentation/views/ResturantDescription.dart';
import 'package:yallanow/Features/foodView/presentation/views/TrendingSec.dart';

class FoodResturantPage extends StatefulWidget {
  const FoodResturantPage({Key? key}) : super(key: key);

  @override
  State<FoodResturantPage> createState() => _FoodResturantPageState();
}

class _FoodResturantPageState extends State<FoodResturantPage>
    with SingleTickerProviderStateMixin {
  late final ScrollController _controller = ScrollController();
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.easeInOut,
  );
  bool _scrolled = true;
  void _scrollListener() {
    final isScrolled = _controller.hasClients &&
        _controller.offset > (_controller.position.minScrollExtent + 60);
    if (_scrolled != isScrolled) {
      setState(() {
        _scrolled = isScrolled;
      });
      if (!_scrolled) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  void initState() {
    super.initState();
    _controller.addListener(_scrollListener);
    _animationController.forward();
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          SliverFadeTransition(
            opacity: _animation,
            sliver: _scrolled
                ? SliverAppBar(
                    pinned: true,
                    title: Text("Burger lover"),
                    leading: Icon(Icons.arrow_back_ios_new_rounded),
                  )
                : SliverPadding(
                    padding: EdgeInsets.only(bottom: 16),
                    sliver: SliverToBoxAdapter(
                      child: FoodResturantAppBar(),
                    ),
                  ),
          ),
          // SliverPadding(
          //   padding: EdgeInsets.only(bottom: 16),
          //   sliver: SliverToBoxAdapter(
          //     child: Visibility(
          //       visible: !_scrolled,
          //       child: FoodResturantAppBar(),
          //     ),
          //   ),
          // ),
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
      bottomNavigationBar: const FoodBottomBar(),
    );
  }
}

class _AppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _AppBarDelegate({
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
  bool shouldRebuild(_AppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
