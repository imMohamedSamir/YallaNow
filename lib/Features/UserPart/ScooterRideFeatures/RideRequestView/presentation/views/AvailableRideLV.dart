import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/models/user_request_model.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/send_request_cubit/send_request_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/AvailableRideCard.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/views/LoadingRides.dart';
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
  UserRequestModel? userRequestModel;

  @override
  void initState() {
    userRequestModel = BlocProvider.of<SendRequestCubit>(context).requestModel;
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
    return BlocConsumer<RidePriceCubit, RidePriceState>(
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
            userRequestModel!.price = selectedRide?.price;
          });
        }
      },
      builder: (context, state) {
        if (state is RidePriceSuccess) {
          return SingleChildScrollView(
            child: Column(
              children: rides.map((ride) {
                return AvailableRideCard(
                  availableRideModel: ride,
                  value: ride,
                  groupValue: selectedRide,
                  onChanged: (value) {
                    setState(() {
                      selectedRide = value;
                      userRequestModel!.price = selectedRide?.price;
                      userRequestModel!.vehicleType = selectedRide!.name;
                    });
                  },
                  isSelected: selectedRide == ride,
                );
              }).toList(),
            ),
          );
        } else {
          return const LoadingRides();
        }
      },
    );
  }
}
