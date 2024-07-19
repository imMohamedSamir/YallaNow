import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/Repo/CaptinRequestRepo.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinOrdersView/data/models/driver_trips_model/CaptinTripsModel.dart';

part 'captin_trips_state.dart';

class CaptinTripsCubit extends Cubit<CaptinTripsState> {
  CaptinTripsCubit(this._captinRequestRepo) : super(CaptinTripsInitial());
  final CaptinRequestRepo _captinRequestRepo;
  void get() async {
    emit(CaptinTripsLoading());
    var result = await _captinRequestRepo.captinTrips();
    result.fold(
        (fail) => emit(CaptinTripsFailure(errMsg: fail.errMessage)),
        (captinTripsModel) =>
            emit(CaptinTripsSuccess(captinTripsModel: captinTripsModel)));
  }
}
