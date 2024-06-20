import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripsPlacesHeader.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripsPlacesLV.dart';

class TripsPlacesSec extends StatelessWidget {
  const TripsPlacesSec({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TripsPlacesHeader(),
        Gap(12),
        TripsPlacesLV(),
      ],
    );
  }
}
