import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/CurrentLocationCubit/current_location_cubit_cubit.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/views/AddAddressButton.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/views/AddressMapSec.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/views/AddressSearchSec.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/views/CurrentLocationIcon.dart';

class AddressMapBody extends StatelessWidget {
  const AddressMapBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          const AddressMapSec(),
          const Positioned(
            top: 24,
            left: 16,
            right: 16,
            child: AddressSearchSec(),
          ),
          // const Center(child: Icon(Icons.location_on, size: 32)),
          const AddAddressButton(),
          Positioned(
            bottom: 102,
            right: 16,
            child: CurrentLocationIcon(
              onPressed: () {
                BlocProvider.of<CurrentLocationCubit>(context)
                    .updateMyLocation();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AddressDetailsModel {
  late final String title, dsc;
}
