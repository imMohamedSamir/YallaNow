import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/TripInfoModel.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/trip_details_cubit.dart/trip_details_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/trip_page_cubit/trip_page_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripAppBar.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripDescription.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripDetails.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripOverView.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripProgram.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ResturantPageLoading.dart';
import 'package:yallanow/generated/l10n.dart';

class TripPgaeBody extends StatelessWidget {
  const TripPgaeBody({super.key});
  @override
  Widget build(BuildContext context) {
    final scrollController =
        BlocProvider.of<TripPageCubit>(context).scrollController;
    return BlocBuilder<TripDetailsCubit, TripDetailsState>(
      builder: (context, state) {
        if (state is TripDetailsSuccess) {
          TripInfoModel trip = state.trip;
          String program = trip.program!.isNotEmpty
              ? trip.program?.first["description"]
              : "Coming soon";
          return CustomScrollView(
            controller: scrollController,
            slivers: [
              const TripAppBar(),
              const SliverToBoxAdapter(child: TripDescription()),
              SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  sliver: SliverToBoxAdapter(
                      child: TripOverView(dsc: trip.description ?? ""))),
              SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  sliver:
                      SliverToBoxAdapter(child: TripProgram(program: program))),
              SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  sliver: SliverToBoxAdapter(
                      child: TripDetails(
                    title: S.of(context).Takewithyou,
                    details: trip.guides ?? [],
                  ))),
              SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  sliver: SliverToBoxAdapter(
                      child: TripDetails(
                          title: S.of(context).Include,
                          details: trip.contains ?? []))),
              SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  sliver: SliverToBoxAdapter(
                      child: TripDetails(
                    title: S.of(context).Notinclude,
                    details: trip.notContains ?? [],
                  )))
            ],
          );
        } else if (state is TripDetailsLoading) {
          return const TripPageLoading();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
