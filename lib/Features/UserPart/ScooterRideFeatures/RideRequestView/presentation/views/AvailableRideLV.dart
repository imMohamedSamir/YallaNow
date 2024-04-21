import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/AvailableRideCard.dart';

class AvailableRideLV extends StatefulWidget {
  const AvailableRideLV({super.key});

  @override
  State<AvailableRideLV> createState() => _AvailableRideLVState();
}

class _AvailableRideLVState extends State<AvailableRideLV> {
  AvailableRideModel? selectedRide;
  bool isactive = false;
  static List<AvailableRideModel> Rides = [
    AvailableRideModel(
        name: "Bicycle Delivery",
        price: "55",
        arriveTime: "10:30",
        distance: "20",
        img: Assets.imagesAvailScooter),
    AvailableRideModel(
        name: "Bicycle Delivery",
        price: "60",
        arriveTime: "10:30",
        distance: "20",
        img: Assets.imagesAvailScooter),
    AvailableRideModel(
        name: "Bicycle Delivery",
        price: "40",
        arriveTime: "10:30",
        distance: "20",
        img: Assets.imagesAvailScooter)
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: Rides.map((ride) {
          return AvailableRideCard(
            availableRideModel: ride,
            value: ride,
            groupValue: selectedRide,
            onChanged: (value) {
              setState(() {
                selectedRide = value;
              });
            },
            isSelected: selectedRide == ride,
          );
        }).toList(),
      ),
    );
  }
}
