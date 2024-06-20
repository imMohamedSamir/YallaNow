import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/Repo/TripsRepoImpl.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/trip_details_cubit.dart/trip_details_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/trip_page_cubit/trip_page_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripBookButton.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripPgaeBody.dart';

class TripPage extends StatelessWidget {
  const TripPage({super.key, this.id});
  final String? id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grayColor,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TripPageCubit()..scrollUpdate(),
          ),
          BlocProvider(
            create: (context) =>
                TripDetailsCubit(getIt.get<TripsRepoImpl>())..get(id: id!),
          ),
        ],
        child: const TripPgaeBody(),
      ),
      bottomNavigationBar: TripBookButton(tripId: id!),
    );
  }
}
