import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/Repo/TripsRepo.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_card_model.dart';

part 'explore_trips_state.dart';

class ExploreTripsCubit extends Cubit<ExploreTripsState> {
  ExploreTripsCubit(this.tripsRepo) : super(ExploreTripsInitial());
  final TripsRepo tripsRepo;
  int currentPage = 1;
  bool hasMore = true;

  void get() async {
    emit(ExploreTripsLoading());
    var result =
        await tripsRepo.getExplorTrips(pageNumber: currentPage, pageSize: 5);

    result.fold((fail) => emit(ExploreTripsFailure(errMsg: fail.errMessage)),
        (trips) {
      hasMore = trips.length ==
          5; // Assuming the API returns a maximum of 5 items per page
      emit(ExploreTripsSuccess(
          trips: trips, hasMore: hasMore, isFirstPage: currentPage == 1));
    });
  }

  void next() async {
    if (!hasMore) return;
    emit(ExploreTripsLoading());
    currentPage++;
    var result =
        await tripsRepo.getExplorTrips(pageNumber: currentPage, pageSize: 5);

    result.fold((fail) => emit(ExploreTripsFailure(errMsg: fail.errMessage)),
        (trips) {
      hasMore = trips.length == 5;
      if (trips.isEmpty) {
        log("trips is empty");
        currentPage--;
        get();
      } else {
        emit(ExploreTripsSuccess(
            trips: trips, hasMore: hasMore, isFirstPage: currentPage == 1));
      }
    });
  }

  void back() async {
    if (currentPage <= 1) return;
    emit(ExploreTripsLoading());
    currentPage--;
    var result =
        await tripsRepo.getExplorTrips(pageNumber: currentPage, pageSize: 5);

    result.fold((fail) => emit(ExploreTripsFailure(errMsg: fail.errMessage)),
        (trips) {
      hasMore = trips.length == 5;
      emit(ExploreTripsSuccess(
          trips: trips, hasMore: hasMore, isFirstPage: currentPage == 1));
    });
  }
}
