import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/Google_Api_services.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/Repo/TripsRepoImpl.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/place_trips_cubit/place_trips_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/trips_popular_cubit/trips_popular_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripsPlaceViewBody.dart';

class TripsPlaceView extends StatelessWidget {
  const TripsPlaceView({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PlaceTripsCubit(
              getIt.get<TripsRepoImpl>(), getIt.get<GoogleMapsServices>())
            ..get(dst: name),
        ),
        BlocProvider(
            create: (context) => TripsPopularCubit(
                getIt.get<TripsRepoImpl>(), getIt.get<GoogleMapsServices>())
              ..get()),
      ],
      child: Scaffold(
        appBar: secondAppBar(context, title: name),
        body: const TripsPlaceViewBody(),
      ),
    );
  }
}
