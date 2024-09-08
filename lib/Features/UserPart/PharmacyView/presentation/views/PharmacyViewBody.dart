import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmaciesSec.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyOffersSec.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/SearchBar.dart';

class PharmacyViewBody extends StatelessWidget {
  const PharmacyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(top: 12),
            sliver: SliverToBoxAdapter(child: PharmacySearchBar()),
          ),
          PharmacyOffersSec(),
          PharmaciesSec()
        ],
      ),
    );
  }
}
