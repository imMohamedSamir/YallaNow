import 'dart:convert';
import 'dart:math' as math;
import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:uuid/uuid.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/TokenManger.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/DriverInfo.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/DriverResponse.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/views/CaptinMapSec.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/views/CaptinRequestBS.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/Repos/SignalR_Service.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/models/RequestDetails.dart';

part 'CaptinRequestState.dart';

class CaptinRequestCubit extends Cubit<CaptinRequestState> {
  CaptinRequestCubit(this.signalRService) : super(CaptinRequestInitial()) {
    _setupSignalRListeners();
  }

  final SignalRService signalRService;
  bool _isConnected = false;
  bool _isJoined = false;
  var uuid = const Uuid();
  RequestDetails requestDetails = RequestDetails();
  DriverInfo driverInfo = DriverInfo();

  void _setupSignalRListeners() {
    signalRService.connection.on('ReceiveMessage', (arg) {
      if (arg == null) {
        log("No message received");
      } else {
        log("Received message: ${arg.toString()}");
      }
    });
    signalRService.connection.on('ReceiveDriverResponse', (arg) {
      if (arg == null) {
        log("No message received");
      } else {
        log("Received Driver Response: ${arg.toString()}");
      }
    });
    signalRService.connection.on("ReceiveRideRequest", (request) {
      if (request == null || request.isEmpty) {
        log("Received an empty request.");
        return;
      }
      try {
        var firstElement = request.first;
        RequestDetails requestModel;

        if (firstElement is Map<String, dynamic>) {
          requestModel = RequestDetails.fromJson(firstElement);
        } else if (firstElement is String) {
          Map<String, dynamic> msg = jsonDecode(firstElement);
          requestModel = RequestDetails.fromJson(msg);
        } else {
          log("Unexpected request format: ${firstElement.runtimeType}");
          return;
        }

        _createNotification(requestModel);
      } catch (e) {
        log("Error parsing request: $e");
      }
    });
  }

  void checkLocationPermission() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationServiceEnabled) {
      emit(CaptinRequestDisabled());
      return;
    }

    Geolocator.getServiceStatusStream().listen((ServiceStatus status) async {
      if (status == ServiceStatus.disabled) {
        if (signalRService.connection.state == HubConnectionState.Connected) {
          await signalRService.stopConnection();
          _isJoined = false;
          _isConnected = false;
        }
        emit(CaptinRequestDisabled());
      } else {
        emit(CaptinRequestInitial());
      }
    });
  }

  Future<void> connect() async {
    if (!_isConnected) {
      emit(CaptinRequestLoading());
      var result = await signalRService.startConnection();
      result.fold((faile) => emit(CaptinRequestFailuer()), (r) {
        emit(CaptinRequestConnected());
        _isConnected = true;
      });
    } else {}
  }

  Future<void> joinGroup({required String groupName}) async {
    var result = await signalRService.joinGroup(groupName);
    result.fold((faile) => emit(CaptinRequestFailuer()),
        (r) => emit(CaptinRequestJoinded()));
  }

  void leaveGroup({required String groupName}) async {
    var result = await signalRService.leaveGroup(groupName);
    result.fold((faile) => emit(CaptinRequestFailuer()), (r) => null);
  }

  Future<void> toggleGroupMembership(String group) async {
    if (!_isJoined) {
      await joinGroup(groupName: group);
      _isJoined = true;
    } else {
      leaveGroup(groupName: group);
      _isJoined = false;
    }
  }

  Future<void> updateDriverLocation() async {
    driverInfo.driverId = await TokenManager.getUserId();
    var result = await signalRService.updateLocation(
        driverId: driverInfo.driverId!,
        latitude: driverInfo.latitude!,
        longitude: driverInfo.longitude!,
        vehicleType: driverInfo.vehicleType!);
    result.fold((l) => emit(CaptinRequestFailuer()), (r) => null);
  }

  void _createNotification(RequestDetails requestModel) {
    log(requestModel.toJson().toString());
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: math.Random().nextInt(300),
        channelKey: notifChannelKey,
        actionType: ActionType.Default,
        payload: requestModel.toJson(),
        title: 'Ride Request For You!',
        body:
            "from ${requestModel.location} to ${requestModel.destination}\n${requestModel.price} EGP",
        notificationLayout: NotificationLayout.Default,
        backgroundColor: pKcolor,
        wakeUpScreen: true,
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'ACCEPT',
          label: 'Accept',
          actionType: ActionType.Default,
        ),
        NotificationActionButton(
          key: 'REJECT',
          label: 'Reject',
          actionType: ActionType.Default,
        ),
      ],
    );
  }

  Future<void> sendDriverResponse(
      {required DriverResponse driverResponse}) async {
    driverResponse.driverId = await TokenManager.getUserId();
    log(driverResponse.toJson().toString());
    var result = await signalRService.respondToRideRequest(driverResponse);
    result.fold((faile) => emit(CaptinRequestFailuer()), (r) => null);
  }

  Future<void> handleReceivedRequest(BuildContext context,
      {required ReceivedAction action}) async {
    requestDetails = RequestDetails.fromJson(action.payload!);
    DriverResponse driverResponse = DriverResponse(
        requestId: requestDetails.requestId, price: requestDetails.price);
    if (action.buttonKeyPressed == "ACCEPT") {
      toggleGroupMembership(driverGroup);
      emit(CaptinRequestAccepted(requestDetails: requestDetails));
      NavigateToPage.slideFromRight(
          context: context, page: const CaptinMapSec());
      // driverResponse.accept = true;
      // await sendDriverResponse(driverResponse: driverResponse);
    } else if (action.buttonKeyPressed == "REJECT") {
      driverResponse.accept = false;
      await sendDriverResponse(driverResponse: driverResponse);
    } else {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return CaptinRequestBS(
              requestDetails: RequestDetails.fromJson(action.payload!));
        },
      );
    }
  }

  void cancelRide() {
    emit(CaptinRequestInitial());
  }
}
