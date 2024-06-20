import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripExploreTypePagination.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripsExploreType.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripsPopularSec.dart';

class TripsTypeViewBody extends StatelessWidget {
  const TripsTypeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TripsPopularSec(),
            Gap(24),
            TripsExploreType(),
            Gap(16),
            TripExploreTypePagination()
          ],
        ),
      ),
    );
  }
}
