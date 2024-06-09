import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/AvailableRideCard.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/ride_price_cubit/ride_price_cubit.dart';

class AvailableRideLV extends StatefulWidget {
  const AvailableRideLV({super.key});

  @override
  State<AvailableRideLV> createState() => _AvailableRideLVState();
}

class _AvailableRideLVState extends State<AvailableRideLV> {
  AvailableRideModel? selectedRide;
  bool isactive = false;
  double ridePricex = 0.0, rideprice = 0.0;
  List<AvailableRideModel> Rides = [];
  @override
  void initState() {
    Rides = [
      AvailableRideModel(
          name: "Scooter Vehicle 1",
          price: ridePricex.toStringAsFixed(2),
          arriveTime: "10:30",
          distance: "20",
          img: Assets.imagesScooterVehicle1),
      AvailableRideModel(
          name: "Scooter Vehicle 2",
          price: rideprice.toStringAsFixed(2),
          arriveTime: "10:30",
          distance: "20",
          img: Assets.imagesScooterVehicle2),
    ];
    super.initState();
  }

  void updateRides() {
    setState(() {
      Rides = [
        AvailableRideModel(
            name: "Scooter Vehicle 1",
            price: ridePricex.toStringAsFixed(2),
            arriveTime: "10:30",
            distance: "20",
            img: Assets.imagesScooterVehicle1),
        AvailableRideModel(
            name: "Scooter Vehicle 2",
            price: rideprice.toStringAsFixed(2),
            arriveTime: "10:30",
            distance: "20",
            img: Assets.imagesScooterVehicle2),
      ];
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RidePriceCubit, RidePriceState>(
      listener: (context, state) {
        if (state is RidePriceSuccess) {
          rideprice = state.pricesModel.ridePrice ?? 0;
          ridePricex = state.pricesModel.rideXPrice ?? 0;
          updateRides();
        }
      },
      child: SingleChildScrollView(
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
      ),
    );
  }
}
