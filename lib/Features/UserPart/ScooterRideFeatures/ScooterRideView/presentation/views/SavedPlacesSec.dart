import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/views/SavedPlacesIcon.dart';

class SavedPlacesSec extends StatefulWidget {
  const SavedPlacesSec({super.key});

  @override
  State<SavedPlacesSec> createState() => _SavedPlacesSecState();
}

class _SavedPlacesSecState extends State<SavedPlacesSec> {
  static List<SavedPlacesIconModel> places = [
    SavedPlacesIconModel(
      place: "Home",
      iconData: Icons.home_filled,
    ),
    SavedPlacesIconModel(
      place: 'Work',
      iconData: Icons.work_rounded,
    ),
    SavedPlacesIconModel(
      place: 'Favorite',
      iconData: Icons.star_rate_rounded,
    ),
  ];
  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Saved places",
            style: AppStyles.styleMedium16(context)
                .copyWith(color: const Color(0xff5A5A5A))),
        const SizedBox(height: 8),
        Row(
          children: List.generate(
              3,
              (index) => Padding(
                    padding: EdgeInsets.only(right: index == 2 ? 0 : 10.0),
                    child: SavedPlacesIcon(
                      savedPlacesIconModel: places[index],
                    ),
                  )),
        )
      ],
    );
  }
}
