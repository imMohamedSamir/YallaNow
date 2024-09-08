import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/Repo/AddressRepoImpl.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/add_user_address_cubit/add_user_address_cubit.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/views/NewAddressForm.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/views/SaveAddressButtonBuilder.dart';

class NewAddressePage extends StatelessWidget {
  const NewAddressePage(
      {super.key, required this.locationDetails, required this.position});
  final Placemark locationDetails;
  final LatLng position;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddUserAddressCubit(getIt.get<AddressesRepoImpl>()),
      child: Scaffold(
        appBar: secondAppBar(context, title: "New Addresse"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: NewAddressForm(
              locationDetails: locationDetails,
              position: position,
            ),
          ),
        ),
        bottomSheet: SaveAddressButtonBuilder(),
      ),
    );
  }
}
