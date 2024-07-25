import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/views/ResultplacesView.dart';
import 'package:yallanow/generated/l10n.dart';

class ResultsPlacesSec extends StatelessWidget {
  const ResultsPlacesSec({
    super.key,
    required this.places,
  });
  final List<PlaceModel> places;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).Resultplaces,
            style: AppStyles.styleMedium16(context)
                .copyWith(color: const Color(0xff5A5A5A))),
        const SizedBox(height: 16),
        ResultplacesView(
          places: places,
        )
      ],
    );
  }
}
