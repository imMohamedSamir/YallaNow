import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/FirebaseMessagingService.dart';
import 'package:yallanow/Core/utlis/functions/DialogMethode.dart';
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
import 'package:yallanow/generated/l10n.dart';
import 'package:yallanow/main.dart';

part 'captin_ride_request_state.dart';

class CaptinRideRequestCubit extends Cubit<CaptinRideRequestState> {
  CaptinRideRequestCubit(this.messagingService, this.captinRequestRepo)
      : super(CaptinRideRequestInitial()) {
    receiveRequest();
    receiveBackgroundRequest();
  }
  final FirebaseMessagingService messagingService;
  final CaptinRequestRepo captinRequestRepo;
  bool _isJoined = false;
  late RideRequestDetailsModel detailsModel;
  CaptinRequestModel requestModel = CaptinRequestModel();
  CancelModel cancelModel = CancelModel();
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

  Future<void> toggleJoin() async {
    if (!_isJoined) {
      await connect();
      _isJoined = true;
    } else {
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
    await captinRequestRepo.disconnect();
    emit(CaptinRideRequestInitial());
    _isJoined = false;
  }

  void receiveRequest() {
    messagingService.onMessage.listen((message) {
      final key = message.data['key'] as String?;
      // log(message.data.toString());

      if (key == null) {
        log('Key is null');
        return;
      } else {
        switch (key) {
          case "Request":
            _requestNotification(message);
            break;
          case "UserCancel":
            _createCancelNotification(message);
            usercancelRidedialogMethode(navigatorKey.currentContext!);
            break;
          default:
            log("error");
            break;
        }
      }
    });
  }

  void receiveBackgroundRequest() {
    messagingService.onBgMessage.listen((message) {
      log("message ${message.notification?.title}");
      final key = message.data['key'] as String?;
      requestModel = CaptinRequestModel.fromPayload(
          convertMapToString(originalMap: message.data));
      // log(message.data.toString());

      if (key == null) {
        log('Key is null');
        return;
      } else {
        switch (key) {
          case "Request":
            showModalBottomSheet(
              isScrollControlled: true,
              enableDrag: false,
              isDismissible: false,
              context: navigatorKey.currentContext!,
              builder: (context) {
                return CaptinRequestBS(requestDetails: requestModel);
              },
            );
            break;
          // case "UserCancel":
          //   _createCancelNotification(message);
          //   usercancelRidedialogMethode(navigatorKey.currentContext!);
          //   break;
          default:
            log("error");
            break;
        }
      }
    });
  }

  void _createCancelNotification(RemoteMessage requestModel) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: requestModel.hashCode,
        channelKey: notifChannelKey,
        actionType: ActionType.Default,
        title: "تم الغاء الرحلة من العميل",
        body: requestModel.notification!.body,
        notificationLayout: NotificationLayout.Default,
        backgroundColor: pKcolor,
        wakeUpScreen: true,
      ),
    );
  }

  void _requestNotification(RemoteMessage requestmessage) async {
    // log("notification: ${requestmessage.data.toString()}");
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: requestmessage.hashCode,
        channelKey: notifChannelKey,
        actionType: ActionType.Default,
        payload: convertMapToString(originalMap: requestmessage.data),
        title: S.of(navigatorKey.currentContext!).NewRequest,
        body: S.of(navigatorKey.currentContext!).NewRequestBody,
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
    // await Future.delayed(const Duration(seconds: 4), () async {
    //   AwesomeNotifications().dismiss(requestmessage.hashCode);
    //   await captinResponseMethod(
    //       tripId: requestmessage.data["TripId"], isAccepted: false);
    // });
  }

  Future<void> handleReceivedRequest(BuildContext context,
      {required ReceivedAction action}) async {
    requestModel = CaptinRequestModel.fromPayload(action.payload!);
    if (action.buttonKeyPressed == "ACCEPT") {
      await acceptMethod(context, requestModel: requestModel);
      if (!context.mounted) return;
      NavigateToPage.slideFromRight(
          context: context, page: const CaptinMapSec());
    } else if (action.buttonKeyPressed == "REJECT") {
      await captinResponseMethod(
          tripId: requestModel.tripId!, isAccepted: false);
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
    await captinResponseMethod(tripId: requestModel.tripId!, isAccepted: false);
  }

  Future<void> captinResponseMethod(
      {required String tripId, required bool isAccepted}) async {
    // emit(CaptinRideRequestloading());
    CaptinResponseModel responseModel =
        CaptinResponseModel(tripId: tripId, isAccepted: isAccepted);
    var result = await captinRequestRepo.sendDriverResponse(
        driverResponse: responseModel);
    result.fold((fail) => emit(CaptinRideRequestFailure()), (details) {
      log(details.toString());
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
    // messagingService.disconnect();
  }

  Future<void> cancelRequest(BuildContext context,
      {required String reason}) async {
    cancelModel.cancelationReason = reason;
    cancelModel.isUser = false;
    var result = await captinRequestRepo.cancelRide(cancelModel: cancelModel);
    result.fold((fail) => emit(CaptinRideRequestFailure()), (details) {
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
