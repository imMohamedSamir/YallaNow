import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/Repo/TripsRepo.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_card_model.dart';

part 'place_trips_state.dart';

class PlaceTripsCubit extends Cubit<PlaceTripsState> {
  PlaceTripsCubit(this.tripsRepo) : super(PlaceTripsInitial());
  final TripsRepo tripsRepo;
  List<TripCardModel> allTrips = [];
  int currentPage = 0;
  static const int pageSize = 5;
  void get({required String dst}) async {
    emit(PlaceTripsLoading());
    var result = await tripsRepo.getTripsByPlace(dst: dst);
    result.fold((fail) => emit(PlaceTripsFailure(errMsg: fail.errMessage)),
        (trips) {
      allTrips = trips;
      emit(PlaceTripsSuccess(
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
    emit(PlaceTripsLoading());

    final newTrips =
        allTrips.sublist(start, end > allTrips.length ? allTrips.length : end);
    emit(PlaceTripsSuccess(
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
    emit(PlaceTripsLoading());

    final newTrips = allTrips.sublist(start, end);
    emit(PlaceTripsSuccess(
        trips: newTrips,
        currentPage: prevPage,
        hasMore: true,
        direction: AnimationDirection.backward));
    currentPage = prevPage;
  }
}
