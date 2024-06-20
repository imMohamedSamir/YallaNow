import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripExplorePlacePagination.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripsExplorePlace.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripsPopularSec.dart';

class TripsPlaceViewBody extends StatelessWidget {
  const TripsPlaceViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TripsPopularSec(),
            Gap(24),
            TripsExplorePlace(),
            Gap(8),
            TripExplorePlacePagination(),
            Gap(16),
          ],
        ),
      ),
    );
  }
}
