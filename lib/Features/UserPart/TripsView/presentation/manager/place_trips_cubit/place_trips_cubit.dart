import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Core/utlis/AppLang.dart';
import 'package:yallanow/Core/utlis/Google_Api_services.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/Repo/TripsRepo.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_card_model.dart';

part 'place_trips_state.dart';

class PlaceTripsCubit extends Cubit<PlaceTripsState> {
  PlaceTripsCubit(this.tripsRepo, this.googleMapsServices)
      : super(PlaceTripsInitial());
  final TripsRepo tripsRepo;
  final GoogleMapsServices googleMapsServices;
  List<TripCardModel> allTrips = [];
  int currentPage = 0;
  static const int pageSize = 5;
  void get({required String dst}) async {
    emit(PlaceTripsLoading());
    var result = await tripsRepo.getTripsByPlace(dst: dst);
    result.fold((fail) => emit(PlaceTripsFailure(errMsg: fail.errMessage)),
        (trips) async {
      allTrips = trips;
      List<TripCardModel> selectedTrips = allTrips.take(pageSize).toList();
      if (AppLang.isArabic()) {
        selectedTrips = await _translateTrips(trips: selectedTrips);
      }
      emit(PlaceTripsSuccess(
          trips: selectedTrips,
          hasMore: allTrips.length > pageSize,
          currentPage: 0,
          direction: AnimationDirection.forward));
    });
  }

  void next() async {
    final int nextPage = currentPage + 1;
    final int start = nextPage * pageSize;
    final int end = start + pageSize;

    if (start >= allTrips.length) return;
    emit(PlaceTripsLoading());

    List<TripCardModel> newTrips =
        allTrips.sublist(start, end > allTrips.length ? allTrips.length : end);
    if (AppLang.isArabic()) {
      newTrips = await _translateTrips(trips: newTrips);
    }
    emit(PlaceTripsSuccess(
        trips: newTrips,
        currentPage: nextPage,
        hasMore: end < allTrips.length,
        direction: AnimationDirection.forward));
    currentPage = nextPage;
  }

  void back() async {
    if (currentPage == 0) return;

    final int prevPage = currentPage - 1;
    final int start = prevPage * pageSize;
    final int end = start + pageSize;
    emit(PlaceTripsLoading());

    List<TripCardModel> newTrips = allTrips.sublist(start, end);
    if (AppLang.isArabic()) {
      newTrips = await _translateTrips(trips: newTrips);
    }
    emit(PlaceTripsSuccess(
        trips: newTrips,
        currentPage: prevPage,
        hasMore: true,
        direction: AnimationDirection.backward));
    currentPage = prevPage;
  }

  Future<List<TripCardModel>> _translateTrips(
      {required List<TripCardModel> trips}) async {
    List<TripCardModel> translatedTrips = [];
    for (var trip in trips) {
      trip.name = await _translateText(text: trip.name ?? "");
      trip.description = await _translateText(text: trip.description ?? "");
      trip.destniation = await _translateText(text: trip.destniation ?? "");
      translatedTrips.add(trip);
    }
    return translatedTrips;
  }

  Future<String> _translateText({required String text}) async {
    var result = await googleMapsServices.translate(text: text);
    return result.fold((fail) {
      return text;
    }, (translatedText) {
      return translatedText.data!.translations!.first.translatedText ?? text;
    });
  }
}
