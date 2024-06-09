import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/user_addresses_details_model/user_addresses_details_model.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/user_addresses_cubit/user_addresses_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/scooter_location_cubit/scooter_location_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/home_address_cubit/home_address_cubit.dart';

// void chooseCurrentLocation(BuildContext context) async {
//   var locatioState = BlocProvider.of<ScooterLocationCubit>(context).state;
//   if (locatioState is ScooterLocationGetLocation) {
//     var location =
//         BlocProvider.of<ScooterLocationCubit>(context).locationDetails;

//     UserAddressesDetailsModel address = UserAddressesDetailsModel(
//       city: location?.subAdministrativeArea,
//       street: "${location?.thoroughfare} - ${location?.subThoroughfare}",
//     );
//     BlocProvider.of<HomeAddressCubit>(context).selecteAddress(address: address);
//     Navigator.pop(context);
//   } else {
//     BlocProvider.of<ScooterLocationCubit>(context).getMyCurrentPosition();

//     // After getting the current position, get the location details
//     var locationState = BlocProvider.of<ScooterLocationCubit>(context).state;
//     if (locationState is ScooterLocationGetLocation) {
//       var location =
//           BlocProvider.of<ScooterLocationCubit>(context).locationDetails;

//       UserAddressesDetailsModel address = UserAddressesDetailsModel(
//         city: location?.subAdministrativeArea,
//         street: "${location?.thoroughfare} - ${location?.subThoroughfare}",
//       );
//       BlocProvider.of<HomeAddressCubit>(context)
//           .selecteAddress(address: address);
//       Navigator.pop(context);
//     } else {
//       // Handle if location details are not available
//     }
//   }
// }

// void chooseUserCurrentLocation(BuildContext context) async {
//   BlocProvider.of<ScooterLocationCubit>(context).getMyCurrentPosition();
//   var locatioState = BlocProvider.of<ScooterLocationCubit>(context).state;
//   if (locatioState is ScooterLocationGetLocation) {
//     var location =
//         BlocProvider.of<ScooterLocationCubit>(context).locationDetails;
//     checkUserAddresses(context);
//     UserAddressesDetailsModel address = UserAddressesDetailsModel(
//       city: location?.subAdministrativeArea,
//       street: "${location?.thoroughfare} - ${location?.subThoroughfare}",
//     );
//     // BlocProvider.of<HomeAddressCubit>(context).chooseAddress(address: address);
//   } else {
//     BlocProvider.of<ScooterLocationCubit>(context).getMyCurrentPosition();

//     // After getting the current position, get the location details
//     var locationState = BlocProvider.of<ScooterLocationCubit>(context).state;
//     if (locationState is ScooterLocationGetLocation) {
//       var location =
//           BlocProvider.of<ScooterLocationCubit>(context).locationDetails;

//       UserAddressesDetailsModel address = UserAddressesDetailsModel(
//         city: location?.subAdministrativeArea,
//         street: "${location?.thoroughfare} - ${location?.subThoroughfare}",
//       );
//     } else {
//       // Handle if location details are not available
//     }
//   }
// }

void checkUserAddresses(BuildContext context) {
  final addressState = context.read<UserAddressesCubit>().state;
  if (addressState is UserAddressesSuccess) {
    UserAddressesDetailsModel matchingAddress = addressState.addresses.first;
    if (matchingAddress != null) {
      context.read<HomeAddressCubit>().selecteAddress(address: matchingAddress);
    } else {
      context.read<HomeAddressCubit>().choosetAddress();
    }
  } else {
    // Handle other states, if necessary.
    log("Address state is not UserAddressesSuccess.");
  }
}
