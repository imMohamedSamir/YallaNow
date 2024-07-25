import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/functions/DialogMethode.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/manager/captin_map_cubit/captin_map_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/views/CaptinMapBodyandRequest.dart';

class CaptinMapSec extends StatelessWidget {
  const CaptinMapSec({super.key});
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CaptinMapCubit>(context).updateMyLocation(context);
    return Scaffold(
      body: PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            cancelDriverRidedialogMethode(context);
          },
          child: const CaptinMapBodyandRequest()),
    );
  }
}
