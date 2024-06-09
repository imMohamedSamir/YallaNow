import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/pharmacy_model.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PahrmacyBestsellerSec.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyAppBar.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyCategorySec.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyDescription.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyHealthSec.dart';

class PharmacyPageBody extends StatelessWidget {
  const PharmacyPageBody({super.key, required this.pharmacy});

  final PharmacyModel pharmacy;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
                child: PharmacyAppBar(imgUrl: pharmacy.imgUrl ?? ''))),
        SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            sliver: SliverToBoxAdapter(
                child: PharmacyDescription(pharmacy: pharmacy))),
        const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(child: Divider(height: 26))),
        const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            sliver: SliverToBoxAdapter(child: PharmacyCategorySec())),
        const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            sliver: SliverToBoxAdapter(child: PahrmacyBestsellerSec())),
        const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            sliver: SliverToBoxAdapter(child: PharmacyHealthSec())),
      ],
    );
  }
}
