import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:uuid/uuid.dart';
import 'package:yallanow/Core/utlis/FirebaseMessagingService.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/Repo/CaptinRequestRepo.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/ready_model.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/update_location_model.dart';

part 'ready_for_trips_state.dart';

class ReadyForTripsCubit extends Cubit<ReadyForTripsState> {
  ReadyForTripsCubit(this.captinRequestRepo) : super(ReadyForTripsInitial()) {
    getLocation();
    emit(ReadyForTripsInitial());
  }

  final CaptinRequestRepo captinRequestRepo;
  StreamSubscription<Position>? positionStreamSubscription;

  ReadyModel readyModel = ReadyModel();
  UpdateLocationModel updateLocationModel = UpdateLocationModel();
  Uuid uuid = const Uuid();
  bool isFirst = true;
  Location location = Location();

  void fetch() async {
    emit(ReadyForTripsLoading());
    var result = await captinRequestRepo.readyForTrips(readyModel: readyModel);
    result.fold((fail) => emit(ReadyForTripsFailure()), (respons) async {
      emit(ReadyForTripsSuccess());
      await getData();
    });
  }

  Future<void> getData() async {
    updateLocationModel.driverId = uuid.v4();
    await updateLocation();
  }

  Future<void> getLocation() async {
    readyModel.id = uuid.v4();
    readyModel.deviceToken = await FirebaseMessagingService().getToken();
    var locationData = await location.getLocation();
    readyModel.currentLatitude = locationData.latitude;
    readyModel.currentLongitude = locationData.longitude;
    log("first position :${readyModel.toJson().toString()}");
  }

  Future<void> updateLocation() async {
    // Cancel any existing subscription before creating a new one
    await positionStreamSubscription?.cancel();
    positionStreamSubscription = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(distanceFilter: 0),
    ).listen(
      (position) async {
        updateLocationModel.latitude = position.latitude;
        updateLocationModel.longitude = position.longitude;
        readyModel.currentLatitude = position.latitude;
        readyModel.currentLongitude = position.longitude;
        var result = await captinRequestRepo.updateDriverLocation(
          updateModel: updateLocationModel,
        );
        result.fold(
          (fail) => emit(ReadyForTripsFailure()),
          (success) => log("Location updated successfully"),
        );
      },
      onError: (error) {
        emit(ReadyForTripsFailure());
      },
    );
  }

  void stopListening() async {
    await positionStreamSubscription?.cancel();
    positionStreamSubscription = null;
    isFirst = true;
    emit(ReadyForTripsInitial());
    log("stopListening");
  }

  @override
  Future<void> close() async {
    await positionStreamSubscription?.cancel();
    log("ReadyForTripsCubit closed");
    return super.close();
  }
}
