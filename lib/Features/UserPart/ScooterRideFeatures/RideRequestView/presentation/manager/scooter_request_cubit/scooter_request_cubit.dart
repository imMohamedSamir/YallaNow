import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:uuid/uuid.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/TokenManger.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/request_model.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/views/CaptinRequestBS.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/Repos/SignalR_Service.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/models/RequestDetails.dart';

part 'scooter_request_state.dart';

class ScooterRequestCubit extends Cubit<ScooterRequestState> {
  final SignalRService signalRService;
  RequestDetails userRequest = RequestDetails();
  var uuid = const Uuid();
  // bool _isJoined = false;
  bool _isConnected = false;
  ScooterRequestCubit(this.signalRService) : super(ScooterRequestInitial()) {
    _setupSignalRListeners();
  }

  Future<void> connect() async {
    if (!_isConnected) {
      emit(ScooterRequestLoading());
      var result = await signalRService.startConnection();
      result.fold((faile) => emit(ScooterRequestFailure()), (r) {
        emit(ScooterRequestConnected());
        _isConnected = true;
      });
    } else {}
  }

  Future<void> joinGroup({required String groupName}) async {
    var result = await signalRService.joinGroup(groupName);
    result.fold((faile) => emit(ScooterRequestFailure()),
        (r) => emit(ScooterRequestConnected()));
  }

  void leaveGroup({required String groupName}) async {
    var result = await signalRService.leaveGroup(groupName);
    result.fold((faile) => emit(ScooterRequestFailure()),
        (r) => emit(ScooterRequestInitial()));
  }

  void _setupSignalRListeners() {
    signalRService.connection.on('ReceiveMessage', (arg) {
      if (arg == null) {
        log("No message received");
      } else {
        log("Received message: ${arg.toString()}");
      }
    });

    signalRService.connection.on("RequestAccepted", (arguments) {
      emit(ScooterRequestDriverAccepted());
      log("Accepted status: ${arguments?.first.toString()}");
    });

    signalRService.connection.on("RequestRejected", (arguments) {
      emit(ScooterRequestDriverRejected());
      log("Rejected status: ${arguments?.first.toString()}");
    });
  }

  Future<void> sendRideRequest() async {
    userRequest.requestId = uuid.v4();
    userRequest.connectionId = signalRService.connection.connectionId;
    // log(userRequest.toJson().toString());
    emit(ScooterRequestLoading());
    userRequest.userName = await TokenManager.getUserName();
    var resutl = await signalRService.sendRideRequest(userRequest);
    resutl.fold((l) => emit(ScooterRequestFailure()), (r) => null);
  }

  Future<void> acceptRequest(String requestId,
      {RequestDetails? requestDetails}) async {
    String driverConnectionId = signalRService.connection.connectionId!;
    try {
      await signalRService.connection.invoke('AcceptRequest',
          args: <Object>[requestId, driverConnectionId]);
      if (requestDetails != null) {
        emit(ScooterRequestAccepted(requestData: requestDetails));
      }
    } on Exception catch (e) {
      log("Error accepting request: ${e.toString()}");
      emit(ScooterRequestFailure());
    }
  }

  Future<void> rejectRequest(String requestId) async {
    String driverConnectionId = signalRService.connection.connectionId!;
    try {
      await signalRService.connection.invoke('RejectRequest',
          args: <Object>[requestId, driverConnectionId]);
      emit(ScooterRequestRejected());
    } on Exception catch (e) {
      log("Error rejecting request: ${e.toString()}");
      emit(ScooterRequestFailure());
    }
  }

  void cancelRequest() {
    emit(ScooterRequestInitial());
  }

  Future<void> closeConnection() async {
    await signalRService.stopConnection();
    log("Connection closed: ${signalRService.connection.state}");
    emit(ScooterRequestDisconnected());
  }
}
