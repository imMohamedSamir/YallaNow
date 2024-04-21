import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/scooter_location_cubit/scooter_location_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/MainHomeView.dart';

class CurrentLocationButtonBuilder extends StatelessWidget {
  const CurrentLocationButtonBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "Use current location",
      txtcolor: const Color(0xffFFFFFF),
      btncolor: pKcolor,
      onPressed: () {
        BlocProvider.of<ScooterLocationCubit>(context).getMyCurrentPosition();

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MainHomeView()));
      },
    );
  }
}
