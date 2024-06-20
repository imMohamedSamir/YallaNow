import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripDetails.dart';
import 'package:yallanow/generated/l10n.dart';

class NotIncludeBuilder extends StatelessWidget {
  const NotIncludeBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        sliver: SliverToBoxAdapter(
            child: TripDetails(
          title: S.of(context).Notinclude,
          details: const ["PERSONAL EXPENSES", "TIPS", "1€ GOVERNMENT TAX"],
        )));
  }
}
