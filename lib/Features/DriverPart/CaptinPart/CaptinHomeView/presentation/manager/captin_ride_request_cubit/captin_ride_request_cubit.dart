import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/FirebaseMessagingService.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/utlis/functions/convertMapToString.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/Repo/CaptinRequestRepo.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/CaptinCancelModel.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/CaptinRequestModel.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/CaptinResponseModel.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/RideRequestDetailsModel.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/CaptinHomeView.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/views/CaptinMapSec.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/views/CaptinRequestBS.dart';

part 'captin_ride_request_state.dart';

class CaptinRideRequestCubit extends Cubit<CaptinRideRequestState> {
  CaptinRideRequestCubit(this.messagingService, this.captinRequestRepo)
      : super(CaptinRideRequestInitial()) {
    receiveRequest();
  }
  final FirebaseMessagingService messagingService;
  final CaptinRequestRepo captinRequestRepo;
  bool _isJoined = false;
  late RideRequestDetailsModel detailsModel;
  CaptinCancelModel cancelModel = CaptinCancelModel();
  void checkLocationPermission() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationServiceEnabled) {
      emit(CaptinRideRequestDisabled());
      return;
    }
    Geolocator.getServiceStatusStream().listen((ServiceStatus status) async {
      if (status == ServiceStatus.disabled) {
        emit(CaptinRideRequestDisabled());
      } else {
        emit(CaptinRideRequestInitial());
      }
    });
  }

  Future<void> toggleGroupMembership() async {
    if (!_isJoined) {
      // await joinGroup(groupName: group);
      await connect();
      _isJoined = true;
    } else {
      // await leaveGroup(groupName: group);
      await disconnect();
      _isJoined = false;
      emit(CaptinRideRequestInitial());
    }
  }

  Future<void> initialize() async {
    var result = await messagingService.init();
    result.fold((l) => emit(CaptinRideRequestFailure()), (r) => null);
  }

  Future<void> connect() async {
    emit(CaptinRideRequestloading());
    await messagingService.connect();
    emit(CaptinRideRequestConnected());
  }

  Future<void> disconnect() async {
    emit(CaptinRideRequestloading());
    await messagingService.disconnect();
    _isJoined = false;
  }

  void receiveRequest() {
    messagingService.onMessage.listen((message) {
      _createNotification(message);
    });
  }

  void _createNotification(RemoteMessage requestModel) {
    log("notification: ${requestModel.data.toString()}");
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: requestModel.hashCode,
        channelKey: notifChannelKey,
        actionType: ActionType.Default,
        payload: convertMapToString(originalMap: requestModel.data),
        title: "هناك رحلة لك",
        body: requestModel.notification!.body,
        notificationLayout: NotificationLayout.Default,
        backgroundColor: pKcolor,
        wakeUpScreen: true,
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'ACCEPT',
          label: "قبول",
          actionType: ActionType.Default,
        ),
        NotificationActionButton(
          key: 'REJECT',
          label: 'رفض',
          actionType: ActionType.Default,
        ),
      ],
    );
  }

  Future<void> handleReceivedRequest(BuildContext context,
      {required ReceivedAction action}) async {
    CaptinRequestModel requestModel =
        CaptinRequestModel.fromPayload(action.payload!);
    if (action.buttonKeyPressed == "ACCEPT") {
      await acceptMethod(context, requestModel: requestModel);
      if (!context.mounted) return;
      NavigateToPage.slideFromRight(
          context: context, page: const CaptinMapSec());
    } else if (action.buttonKeyPressed == "REJECT") {
      await rejectMethod(context, tripId: requestModel.tripId!);
    } else {
      showModalBottomSheet(
        isScrollControlled: true,
        enableDrag: false,
        isDismissible: false,
        context: context,
        builder: (context) {
          return CaptinRequestBS(requestDetails: requestModel);
        },
      );
    }
  }

  Future<void> onDismissAction(BuildContext context,
      {required ReceivedAction action}) async {
    CaptinRequestModel requestModel =
        CaptinRequestModel.fromPayload(action.payload!);
    await rejectMethod(context, tripId: requestModel.tripId!);
  }

  Future<void> captinResponseMethod(
      {required String tripId, required bool isAccepted}) async {
    // emit(CaptinRideRequestloading());
    CaptinResponseModel responseModel =
        CaptinResponseModel(tripId: tripId, isAccepted: isAccepted);
    var result = await captinRequestRepo.sendDriverResponse(
        driverResponse: responseModel);
    result.fold((fail) => emit(CaptinRideRequestFailure()), (details) {
      if (responseModel.isAccepted!) {
        detailsModel = RideRequestDetailsModel.fromJson(details);
        log(detailsModel.toJson().toString());
      } else {
        log(details);
      }
    });
  }

  Future<void> acceptMethod(BuildContext context,
      {required CaptinRequestModel requestModel}) async {
    cancelModel.tripId = requestModel.tripId;
    await captinResponseMethod(tripId: requestModel.tripId!, isAccepted: true);
    emit(CaptinRideRequestjAccepted(detailsModel: requestModel));
    _isJoined = false;
    messagingService.disconnect();
  }

  Future<void> rejectMethod(BuildContext context,
      {required String tripId}) async {
    await captinResponseMethod(tripId: tripId, isAccepted: false);
  }

  Future<void> cancelRequest(BuildContext context,
      {required String reason}) async {
    cancelModel.cancelationReason = reason;
    log(cancelModel.toJson().toString());
    var result = await captinRequestRepo.cancelRide(cancelModel: cancelModel);
    result.fold((fail) => emit(CaptinRideRequestFailure()), (details) {
      log(details.toString());
      Navigator.pop(context);
      NavigateToPage.slideFromLeftAndRemove(
          context: context, page: const CaptinHomeView());
      emit(CaptinRideRequestInitial());
    });
  }

  void setInitial() {
    emit(CaptinRideRequestInitial());
  }
}
