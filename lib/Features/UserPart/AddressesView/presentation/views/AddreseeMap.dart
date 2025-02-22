import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/location_service.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/CurrentLocationCubit/current_location_cubit_cubit.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/views/AddressMapBody.dart';
import 'package:yallanow/Core/utlis/RoutesUtlis.dart';

class AddressMapView extends StatelessWidget {
  const AddressMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CurrentLocationCubit(LocationService(), RoutesUtils())
                ..updateMyLocation(),
        ),
      ],
      child: const Scaffold(
          body: AddressMapBody(), resizeToAvoidBottomInset: false),
    );
  }
}
