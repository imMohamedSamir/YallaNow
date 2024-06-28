import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Core/utlis/AppLang.dart';
import 'package:yallanow/Core/utlis/Google_Api_services.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/Repo/TripsRepo.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_popular_model.dart';

part 'trips_popular_state.dart';

class TripsPopularCubit extends Cubit<TripsPopularState> {
  TripsPopularCubit(this.tripsRepo, this.googleMapsServices)
      : super(TripsPopularInitial());
  final TripsRepo tripsRepo;
  final GoogleMapsServices googleMapsServices;
  void get() async {
    emit(TripsPopularLoading());
    var result = await tripsRepo.getPopularTrips();
    result.fold((fail) => emit(TripsPopularFailure(errMsg: fail.errMessage)),
        (trips) async {
      final shuffledTrips = trips.toList()..shuffle();
      List<PopularTripModel> randomFourTrips = shuffledTrips.sublist(0, 4);
      if (AppLang.isArabic()) {
        randomFourTrips = await _translateList(randomFourTrips);
      }
      emit(TripsPopularSuccess(trips: randomFourTrips));
    });
  }

  Future<List<PopularTripModel>> _translateList(
      List<PopularTripModel> trips) async {
    List<PopularTripModel> translatedTrips = [];
    for (var trip in trips) {
      trip.name = await _translateText(text: trip.name ?? "");
      trip.destination = await _translateText(text: trip.destination ?? "");
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
