import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Core/utlis/Google_Api_services.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/Repo/TripsRepo.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/TripInfoModel.dart';

part 'trip_details_state.dart';

class TripDetailsCubit extends Cubit<TripDetailsState> {
  TripDetailsCubit(this.tripsRepo, this.googleMapsServices)
      : super(TripDetailsInitial());
  final TripsRepo tripsRepo;
  final GoogleMapsServices googleMapsServices;
  void get({required String id}) async {
    emit(TripDetailsLoading());
    var result = await tripsRepo.getTrip(id: id);
    result.fold((fail) => emit(TripDetailsFailure(errMsg: fail.errMessage)),
        (trip) async {
      emit(TripDetailsSuccess(trip: trip));
    });
  }

  Future<String> _translateText({required String text}) async {
    var result = await googleMapsServices.translate(text: text);
    return result.fold((fail) {
      return text;
    }, (translatedText) {
      return translatedText.data!.translations!.first.translatedText ?? text;
    });
  }

  Future<List<dynamic>> _tranlateList({required List<dynamic> list}) async {
    List<dynamic> tanslatedList = [];
    for (var item in list) {
      String translatedItem = await _translateText(text: item);
      tanslatedList.add(translatedItem);
    }
    return tanslatedList;
  }
}
