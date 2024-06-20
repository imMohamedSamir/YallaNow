import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/Repo/TripsRepo.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/TripInfoModel.dart';

part 'trip_details_state.dart';

class TripDetailsCubit extends Cubit<TripDetailsState> {
  TripDetailsCubit(this.tripsRepo) : super(TripDetailsInitial());
  final TripsRepo tripsRepo;
  void get({required String id}) async {
    emit(TripDetailsLoading());
    var result = await tripsRepo.getTrip(id: id);
    result.fold((fail) => emit(TripDetailsFailure(errMsg: fail.errMessage)),
        (trip) => emit(TripDetailsSuccess(trip: trip)));
  }
}
