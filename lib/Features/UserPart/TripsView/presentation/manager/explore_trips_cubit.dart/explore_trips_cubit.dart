import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Core/utlis/Google_Api_services.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/Repo/TripsRepo.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_card_model.dart';

part 'explore_trips_state.dart';

class ExploreTripsCubit extends Cubit<ExploreTripsState> {
  ExploreTripsCubit(this.tripsRepo, this.googleMapsServices)
      : super(ExploreTripsInitial());
  final TripsRepo tripsRepo;
  final GoogleMapsServices googleMapsServices;
  int currentPage = 1;
  bool hasMore = true;

  void get() async {
    emit(ExploreTripsLoading());
    var result =
        await tripsRepo.getExplorTrips(pageNumber: currentPage, pageSize: 5);

    result.fold((fail) => emit(ExploreTripsFailure(errMsg: fail.errMessage)),
        (trips) async {
      hasMore = trips.length == 5;

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
        (trips) async {
      hasMore = trips.length == 5;
      if (trips.isEmpty) {
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
        (trips) async {
      hasMore = trips.length == 5;

      emit(ExploreTripsSuccess(
          trips: trips, hasMore: hasMore, isFirstPage: currentPage == 1));
    });
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
