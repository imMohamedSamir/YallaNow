import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/Repo/CaptinRequestRepo.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/manager/ready_for_trips_cubit/ready_for_trips_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/views/CaptinCheckoutPage.dart';
import 'package:yallanow/main.dart';

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
        (response) async {
      await BlocProvider.of<ReadyForTripsCubit>(navigatorKey.currentContext!)
          .stopListening();
      await _captinRequestRepo.disconnect();
      NavigateToPage.slideFromRight(
          context: navigatorKey.currentContext!,
          page: const CaptinCheckoutPage());
      emit(CaptinStartTripEnded());
    });
  }
}
