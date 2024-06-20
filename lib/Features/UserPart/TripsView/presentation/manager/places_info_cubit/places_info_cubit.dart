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
        (places) => emit(PlacesInfoSuccess(places: places)));
  }
}
