import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/explore_trips_cubit.dart/explore_trips_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/places_info_cubit/places_info_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/trip_types_cubit/trip_types_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/trips_popular_cubit/trips_popular_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/PopulareTripsSec.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripsExplore.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripsPalcesSec.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripsTypeSec.dart';

class TripsViewBody extends StatelessWidget {
  const TripsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ExploreTripsCubit>(context).get();
    BlocProvider.of<PlacesInfoCubit>(context).get();
    BlocProvider.of<TripsPopularCubit>(context).get();
    BlocProvider.of<TripTypesCubit>(context).get();
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 16),
              sliver: SliverToBoxAdapter(child: TripsPlacesSec())),
          SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 16),
              sliver: SliverToBoxAdapter(child: PopulareTripsSec())),
          SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 16),
              sliver: SliverToBoxAdapter(child: TripsTypeSec())),
          SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 16),
              sliver: SliverToBoxAdapter(child: TripsExplore())),
        ],
      ),
    );
  }
}
