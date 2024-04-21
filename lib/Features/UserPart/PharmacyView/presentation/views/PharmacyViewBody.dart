import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmaciesSec.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyOffersSec.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/SearchBar.dart';

class PharmacyViewBody extends StatelessWidget {
  const PharmacyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CategoryAppBar(context, title: "Pharmacy"),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(top: 12),
              sliver: SliverToBoxAdapter(child: HomeSearchBar()),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 24),
              sliver: SliverToBoxAdapter(child: PharmacyOffersSec()),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 24, bottom: 16),
              sliver: SliverToBoxAdapter(child: PharmaciesSec()),
            ),
          ],
        ),
      ),
    );
  }
}
