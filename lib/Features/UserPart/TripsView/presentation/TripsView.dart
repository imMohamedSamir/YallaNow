import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/Google_Api_services.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/Repo/TripsRepoImpl.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/explore_trips_cubit.dart/explore_trips_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/places_info_cubit/places_info_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/trip_types_cubit/trip_types_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/trips_popular_cubit/trips_popular_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripsViewBody.dart';
import 'package:yallanow/generated/l10n.dart';

class TripsView extends StatelessWidget {
  const TripsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ExploreTripsCubit(
              getIt.get<TripsRepoImpl>(), getIt.get<GoogleMapsServices>()),
        ),
        BlocProvider(
          create: (context) => PlacesInfoCubit(getIt.get<TripsRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => TripsPopularCubit(
              getIt.get<TripsRepoImpl>(), getIt.get<GoogleMapsServices>()),
        ),
        BlocProvider(
          create: (context) => TripTypesCubit(getIt.get<TripsRepoImpl>()),
        ),
      ],
      child: Scaffold(
        appBar: secondAppBar(context, title: S.of(context).Trips),
        body: const TripsViewBody(),
      ),
    );
  }
}
