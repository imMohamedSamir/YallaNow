import 'dart:developer';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/FirebaseMessagingService.dart';
import 'package:yallanow/Core/utlis/functions/convertMapToString.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/Repo/CaptinRequestRepo.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/Repo/CaptinRequestRepoImpl.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/CaptinCancelModel.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/models/AcceptRideModel.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/models/DriverInfoModel.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/send_request_cubit/send_request_cubit.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/scooter_location_cubit/scooter_location_cubit.dart';

part 'UserRequestState.dart';

class UserRidRequestCubit extends Cubit<UserRideRequestState> {
  UserRidRequestCubit(this.messagingService, this.captinRequestRepo)
      : super(UserRideRequestInitial()) {
    receiveResponse();
  }
  final FirebaseMessagingService messagingService;
  final CaptinRequestRepo captinRequestRepo;
  var uuid = const Uuid();
  CaptinCancelModel cancelModel = CaptinCancelModel();
  AcceptRideModel? acceptRideModel;
  bool _isJoined = false;
  Future<void> initialize() async {
    var result = await messagingService.init();
    result.fold((l) => emit(UserRideRequestFailure()), (r) => null);
  }

  Future<void> connect() async {
    emit(UserRideRequestLoading());
    await messagingService.connect();
    emit(UserRideRequesConnected());
  }

  Future<void> disconnect() async {
    emit(UserRideRequestLoading());
    await messagingService.disconnect();
  }

  Future<void> toggleConnection() async {
    if (!_isJoined) {
      await connect();
      _isJoined = true;
    } else {
      await disconnect();
      _isJoined = false;
      emit(UserRideRequestInitial());
    }
  }

  void receiveResponse() {
    messagingService.onMessage.listen((message) {
      try {
        log(message.data.toString());
        acceptRideModel = AcceptRideModel.fromJson(message.data);
        cancelModel.tripId = acceptRideModel!.tripId;
        log(acceptRideModel?.toJson().toString() ?? "error");
        emit(UserRideRequestAccepted(driverInfoModel: acceptRideModel!));
        // _createNotification(message, "accepted ride request");
      } catch (e) {
        _createNotification(message, "No Drivers available");
      }
    });
  }

  void _createNotification(RemoteMessage requestModel, String title) {
    log("notification: ${requestModel.data.toString()}");
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: requestModel.hashCode,
        channelKey: notifChannelKey,
        actionType: ActionType.Default,
        // payload: convertMapToString(originalMap: requestModel.data),
        title: title,
        body: requestModel.notification!.body,
        notificationLayout: NotificationLayout.Default,
        backgroundColor: pKcolor,
        wakeUpScreen: true,
      ),
    );
  }

  Future<void> cancelRequest(BuildContext context,
      {required String reason}) async {
    cancelModel.cancelationReason = reason;
    log(cancelModel.toJson().toString());
    var result = await captinRequestRepo.cancelRide(cancelModel: cancelModel);
    result.fold((fail) => emit(UserRideRequestFailure()), (details) {
      log(details.toString());
      BlocProvider.of<ScooterLocationCubit>(context).setInitialState();
      BlocProvider.of<SendRequestCubit>(context).setInitial();
      Navigator.pop(context);

      emit(UserRideRequestInitial());
    });
  }

  void setInitialState() {
    emit(UserRideRequestInitial());
  }
}
