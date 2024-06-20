import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripDetails.dart';
import 'package:yallanow/generated/l10n.dart';

class TakeWithU extends StatelessWidget {
  const TakeWithU({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        sliver: SliverToBoxAdapter(
            child: TripDetails(
          title: S.of(context).Takewithyou,
          details: const [
            "SPORTS SHOES",
            "DRINK",
            "SCARVES - YOU CAN BUY EVEN O",
            "SWEETS FOR BEDOUIN CHILDREN"
          ],
        )));
  }
}
