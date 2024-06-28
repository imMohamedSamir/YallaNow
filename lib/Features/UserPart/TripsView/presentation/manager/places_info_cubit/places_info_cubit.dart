import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/Repo/TripsRepo.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_places_model.dart';

part 'places_info_state.dart';

class PlacesInfoCubit extends Cubit<PlacesInfoState> {
  PlacesInfoCubit(this.tripsRepo) : super(PlacesInfoInitial());
  final TripsRepo tripsRepo;
  void get() async {
    emit(PlacesInfoLoading());
    var result = await tripsRepo.getPlaces();
    result.fold((fail) => emit(PlacesInfoFailure(errMsg: fail.errMessage)),
        (places) async {
      emit(PlacesInfoSuccess(places: places));
    });
  }

  // Future<String> _translateText({required String text}) async {
  //   var result = await googleMapsServices.translate(text: text);
  //   return result.fold((fail) {
  //     return text;
  //   }, (translatedText) {
  //     return translatedText.data!.translations!.first.translatedText ?? text;
  //   });
  // }
}
