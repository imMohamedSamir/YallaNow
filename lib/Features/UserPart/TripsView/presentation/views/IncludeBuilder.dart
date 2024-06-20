import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripDetails.dart';
import 'package:yallanow/generated/l10n.dart';

class IncludeBuilder extends StatelessWidget {
  const IncludeBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        sliver: SliverToBoxAdapter(
            child: TripDetails(
          title: S.of(context).Include,
          details: const [
            "QUIDE",
            "DINNER (WATER, COLA)",
            "TRANSFER",
            "RIDE ON CAMELS",
            "QUAD BIKES FROM 16 YEARS",
            "JEEP",
            "SPIDER CAR"
          ],
        )));
  }
}
