import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/views/RecentPlacesCard.dart';

class RecentplacesView extends StatelessWidget {
  const RecentplacesView({super.key});
  static List<RecentPlacesCardModel> recentPlaces = [
    RecentPlacesCardModel(
        title: "Restaurant",
        subtitle: 'Lorem ipsum dolor sit amet cesincidunt ',
        distance: '2.7km'),
    RecentPlacesCardModel(
        title: "Work",
        subtitle: 'Lorem ipsum dolor sit amet cesincidunt ',
        distance: '2.0km'),
    RecentPlacesCardModel(
        title: "Restaurant",
        subtitle: 'Lorem ipsum dolor sit amet cesincidunt ',
        distance: '1.7km'),
    RecentPlacesCardModel(
        title: "Home",
        subtitle: 'Lorem ipsum dolor sit amet cesincidunt ',
        distance: '3.7km')
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          recentPlaces.length,
          (index) => Padding(
                padding: EdgeInsets.only(
                    bottom: index == recentPlaces.length - 1 ? 0 : 14.0),
                child: RecentPlacesCard(
                    recentPlacesCardModel: recentPlaces[index]),
              )),
    );
  }
}
