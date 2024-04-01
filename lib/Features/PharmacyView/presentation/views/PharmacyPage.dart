import 'package:flutter/material.dart';
import 'package:yallanow/Features/PharmacyView/presentation/views/PahrmacyBestsellerSec.dart';
import 'package:yallanow/Features/PharmacyView/presentation/views/PharmacyAppBar.dart';
import 'package:yallanow/Features/PharmacyView/presentation/views/PharmacyCategorySec.dart';
import 'package:yallanow/Features/PharmacyView/presentation/views/PharmacyDescription.dart';
import 'package:yallanow/Features/PharmacyView/presentation/views/PharmacyHealthSec.dart';
import 'package:yallanow/Features/foodView/presentation/views/FoodBottomBar.dart';

class PharmacyPage extends StatelessWidget {
  const PharmacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(child: PharmacyAppBar())),
          SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              sliver: SliverToBoxAdapter(child: PharmacyDescription())),
          SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(child: Divider(height: 26))),
          SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              sliver: SliverToBoxAdapter(child: PharmacyCategorySec())),
          SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              sliver: SliverToBoxAdapter(child: PahrmacyBestsellerSec())),
          SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              sliver: SliverToBoxAdapter(child: PharmacyHealthSec())),
        ],
      ),
      bottomNavigationBar: const FoodBottomBar(),
    );
  }
}
