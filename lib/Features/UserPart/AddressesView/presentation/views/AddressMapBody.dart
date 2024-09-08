import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/CurrentLocationCubit/current_location_cubit_cubit.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/views/AddAddressButton.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/views/AddressMapSec.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/views/AddressSearchSec.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/views/CurrentLocationIcon.dart';

class AddressMapBody extends StatelessWidget {
  const AddressMapBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const AddressMapSec(),
        Positioned(
          top: AppSizes.getHeight(55, context),
          left: 16,
          right: 16,
          child: const AddressSearchSec(),
        ),
        const Center(
            child: Icon(
          Icons.location_on,
          size: 32,
          color: pKcolor,
        )),
        const AddAddressButton(),
        Positioned(
          bottom: 102,
          right: 16,
          child: CurrentLocationIcon(
            onPressed: () {
              BlocProvider.of<CurrentLocationCubit>(context).updateMyLocation();
            },
          ),
        ),
      ],
    );
  }
}
