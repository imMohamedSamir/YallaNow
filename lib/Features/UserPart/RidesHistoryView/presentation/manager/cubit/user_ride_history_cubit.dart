import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/RidesHistoryView/data/models/UserRideHistoryModel.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/data/Repo/ScooterRideRepo.dart';

part 'user_ride_history_state.dart';

class UserRideHistoryCubit extends Cubit<UserRideHistoryState> {
  UserRideHistoryCubit(this._scooterRideRepo) : super(UserRideHistoryInitial());
  final ScooterRideRepo _scooterRideRepo;
  void get() async {
    emit(UserRideHistoryLoading());
    var result = await _scooterRideRepo.getRideHistory();
    result.fold((fail) => emit(UserRideHistoryFailure(errMsg: fail.errMessage)),
        (rides) => emit(UserRideHistorySuccess(rides: rides)));
  }
}
