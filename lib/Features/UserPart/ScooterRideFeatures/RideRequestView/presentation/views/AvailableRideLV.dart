import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/models/RequestDetails.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/scooter_request_cubit/scooter_request_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/AvailableRideCard.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/ride_price_cubit/ride_price_cubit.dart';

class AvailableRideLV extends StatefulWidget {
  const AvailableRideLV({super.key});

  @override
  State<AvailableRideLV> createState() => _AvailableRideLVState();
}

class _AvailableRideLVState extends State<AvailableRideLV> {
  AvailableRideModel? selectedRide;
  double ridePricex = 0.0, rideprice = 0.0;
  List<AvailableRideModel> rides = [];
  RequestDetails? userRequestModel;

  @override
  void initState() {
    userRequestModel =
        BlocProvider.of<ScooterRequestCubit>(context).userRequest;
    super.initState();
    rides = [
      AvailableRideModel(
          name: "Scooter Vehicle 1",
          price: ridePricex.toStringAsFixed(2),
          img: Assets.imagesScooterVehicle1),
      AvailableRideModel(
          name: "Scooter Vehicle 2",
          price: rideprice.toStringAsFixed(2),
          img: Assets.imagesScooterVehicle2),
    ];
    selectedRide = rides.isNotEmpty ? rides[0] : null;
    userRequestModel!.vehicleType = selectedRide!.name;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RidePriceCubit, RidePriceState>(
      listener: (context, state) {
        if (state is RidePriceSuccess) {
          setState(() {
            rideprice = state.pricesModel.ridePrice ?? 0;
            ridePricex = state.pricesModel.rideXPrice ?? 0;
            rides = [
              AvailableRideModel(
                  name: "Scooter Vehicle 1",
                  price: ridePricex.toStringAsFixed(2),
                  img: Assets.imagesScooterVehicle1),
              AvailableRideModel(
                  name: "Scooter Vehicle 2",
                  price: rideprice.toStringAsFixed(2),
                  img: Assets.imagesScooterVehicle2),
            ];
            selectedRide = rides.isNotEmpty ? rides[0] : null;
            BlocProvider.of<ScooterRequestCubit>(context).userRequest.price =
                selectedRide?.price;
          });
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: rides.map((ride) {
            return AvailableRideCard(
              availableRideModel: ride,
              value: ride,
              groupValue: selectedRide,
              onChanged: (value) {
                setState(() {
                  selectedRide = value;
                  BlocProvider.of<ScooterRequestCubit>(context)
                      .userRequest
                      .price = selectedRide?.price;
                  userRequestModel!.vehicleType = selectedRide!.name;
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
