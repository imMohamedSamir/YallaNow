import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/Repo/TripsRepo.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_popular_model.dart';

part 'trips_popular_state.dart';

class TripsPopularCubit extends Cubit<TripsPopularState> {
  TripsPopularCubit(this.tripsRepo) : super(TripsPopularInitial());
  final TripsRepo tripsRepo;
  void get() async {
    emit(TripsPopularLoading());
    var result = await tripsRepo.getPopularTrips();
    result.fold((fail) => emit(TripsPopularFailure(errMsg: fail.errMessage)),
        (trips) {
      final shuffledTrips = trips.toList()..shuffle();
      final randomFourTrips = shuffledTrips.sublist(0, 4);
      log(randomFourTrips.length.toString());
      emit(TripsPopularSuccess(trips: randomFourTrips));
    });
  }
}
