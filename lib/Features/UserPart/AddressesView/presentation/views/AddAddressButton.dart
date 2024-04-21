import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/CurrentLocationCubit/current_location_cubit_cubit.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/views/NewAddressePage.dart';

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: BlocListener<CurrentLocationCubit, CurrentLocationCubitState>(
        listener: (context, state) {
          if (state is CurrentLocationCubitgetDetails) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewAddressePage(
                      title: state.locationData.administrativeArea!,
                      dsc: state.locationData.subAdministrativeArea!),
                ));
          }
        },
        child: CustomButton(
          text: "Confirm",
          txtcolor: Colors.white,
          btncolor: pKcolor,
          onPressed: () {
            context.read<CurrentLocationCubit>().getLocationDetails();
          },
        ),
      ),
    );
  }
}
