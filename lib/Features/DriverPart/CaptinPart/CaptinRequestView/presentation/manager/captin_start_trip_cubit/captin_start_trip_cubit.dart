import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/Repo/CaptinRequestRepo.dart';

part 'captin_start_trip_state.dart';

class CaptinStartTripCubit extends Cubit<CaptinStartTripState> {
  CaptinStartTripCubit(this._captinRequestRepo)
      : super(CaptinStartTripInitial());
  final CaptinRequestRepo _captinRequestRepo;
  void start({required String tripId}) async {
    emit(CaptinStartTriploading());
    var result = await _captinRequestRepo.startTrip(tripId: tripId);
    result.fold((fail) => emit(CaptinStartTripFailure(errMsg: fail.errMessage)),
        (response) => emit(CaptinStartTripStarted()));
  }

  void end({required String tripId}) async {
    emit(CaptinStartTriploading());
    var result = await _captinRequestRepo.endTrip(tripId: tripId);
    result.fold((fail) => emit(CaptinStartTripFailure(errMsg: fail.errMessage)),
        (response) => emit(CaptinStartTripEnded()));
  }
}
