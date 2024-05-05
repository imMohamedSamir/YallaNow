import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/user_addresses_details_model/user_addresses_details_model.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/AddressesView.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/scooter_location_cubit/scooter_location_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/home_address_cubit/home_address_cubit.dart';

class HomeAddressOption extends StatelessWidget {
  const HomeAddressOption({
    super.key,
    required this.title,
    required this.isAddDifferentAddress,
  });
  final String title;
  final bool isAddDifferentAddress;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (isAddDifferentAddress) {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddressesView()));
        } else {
          chooseCurrentLocation(context);
        }
      },
      shape: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff5A5A5A)),
          borderRadius: BorderRadius.circular(8)),
      leading: isAddDifferentAddress
          ? const Icon(Icons.add)
          : const Icon(Icons.my_location),
      title: Text(
        title,
        style: AppStyles.styleMedium16(context).copyWith(color: scColor),
      ),
    );
  }

  void chooseCurrentLocation(BuildContext context) {
    var locatioState = BlocProvider.of<ScooterLocationCubit>(context).state;
    if (locatioState is ScooterLocationGetLocation) {
      var location =
          BlocProvider.of<ScooterLocationCubit>(context).locationDetails;

      UserAddressesDetailsModel address = UserAddressesDetailsModel(
        city: location?.subAdministrativeArea,
        street: "${location?.thoroughfare} - ${location?.subThoroughfare}",
      );
      BlocProvider.of<HomeAddressCubit>(context)
          .chooseAddress(address: address);
      Navigator.pop(context);
    } else {
      BlocProvider.of<ScooterLocationCubit>(context).getMyCurrentPosition();
    }
  }
}
