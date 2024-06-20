import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/Repo/TripsRepo.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_card_model.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/place_trips_cubit/place_trips_cubit.dart';

part 'trips_by_type_state.dart';

class TripsByTypeCubit extends Cubit<TripsByTypeState> {
  TripsByTypeCubit(this.tripsRepo) : super(TripsByTypeInitial());
  final TripsRepo tripsRepo;
  List<TripCardModel> allTrips = [];
  int currentPage = 0;
  static const int pageSize = 5;
  void get({required String type}) async {
    emit(TripsByTypeLoading());
    var result = await tripsRepo.getTripsByType(type: type);
    result.fold((fail) => emit(TripsByTypeFailure(errMsg: fail.errMessage)),
        (trips) {
      allTrips = trips;
      emit(TripsByTypeSuccess(
          trips: allTrips.take(pageSize).toList(),
          hasMore: allTrips.length > pageSize,
          currentPage: 0,
          direction: AnimationDirection.forward));
    });
  }

  void next() {
    final int nextPage = currentPage + 1;
    final int start = nextPage * pageSize;
    final int end = start + pageSize;

    if (start >= allTrips.length) return;
    emit(TripsByTypeLoading());

    final newTrips =
        allTrips.sublist(start, end > allTrips.length ? allTrips.length : end);
    emit(TripsByTypeSuccess(
        trips: newTrips,
        currentPage: nextPage,
        hasMore: end < allTrips.length,
        direction: AnimationDirection.forward));
    currentPage = nextPage;
  }

  void back() {
    if (currentPage == 0) return;

    final int prevPage = currentPage - 1;
    final int start = prevPage * pageSize;
    final int end = start + pageSize;
    emit(TripsByTypeLoading());

    final newTrips = allTrips.sublist(start, end);
    emit(TripsByTypeSuccess(
        trips: newTrips,
        currentPage: prevPage,
        hasMore: true,
        direction: AnimationDirection.backward));
    currentPage = prevPage;
  }
}
