import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:signalr_netcore/signalr_client.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/request_model.dart';
import 'package:uuid/uuid.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/views/CaptinRequestBS.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/models/RequestDetails.dart';

part 'scooter_request_state.dart';

class ScooterRequestCubit extends Cubit<ScooterRequestState> {
  ScooterRequestCubit() : super(ScooterRequestInitial());

  final HubConnection _connection = HubConnectionBuilder()
      .withUrl("https://yallanow.runasp.net/rideRequestHub")
      .build();
  RequestModel userRequest = RequestModel();
  var uuid = const Uuid();
  bool _isJoined = false;

  void checkLocationPermission() async {
    // Check initial status
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationServiceEnabled) {
      emit(ScooterRequestDisabled());
    }

    // Set up the listener
    Geolocator.getServiceStatusStream().listen((ServiceStatus status) {
      if (status == ServiceStatus.disabled) {
        if (_connection.state == HubConnectionState.Connected) {
          leaveGroup(driverGroup);
        }
        emit(ScooterRequestDisabled());
      } else {
        emit(ScooterRequestInitial());
      }
    });
  }

  Future<void> connect() async {
    emit(ScooterRequestLoading());

    try {
      if (_connection.state == HubConnectionState.Connected) {
        log(_connection.state.toString());
      } else {
        emit(ScooterRequestLoading());
        await _connection.start()!.timeout(const Duration(seconds: 50));
        log("second : ${_connection.state.toString()}");
      }

      // closeConnection();
    } catch (e) {
      log("error connecting to: ${e.toString()}");
      emit(ScooterRequestFailure());
    }
  }

  void recieveRequest() {
    _connection.on('ReceiveMessage', (arg) {
      if (arg == null) {
        log("no message received");
      } else {
        log(arg.toString());
      }
    });
    _connection.on("RequestAccepted", (arguments) {
      leaveGroup(driverGroup);
      _isJoined = false;

      log("accepted stats:${arguments?.first.toString()}");
    });
    _connection.on("RequestRejected", (arguments) {
      log("rejected stats:${arguments?.first.toString()}");
    });
    _connection.on("ReceiveRideRequest", (request) {
      if (request == null || request.isEmpty) {
        log("Received an empty request.");
        return;
      }

      try {
        var firstElement = request.first;
        RequestModel requestModel;

        if (firstElement is Map<String, dynamic>) {
          // The first element is already a Map<String, dynamic>
          requestModel = RequestModel.fromJson(firstElement);
        } else if (firstElement is String) {
          // The first element is a JSON string, parse it
          Map<String, dynamic> msg = jsonDecode(firstElement);
          requestModel = RequestModel.fromJson(msg);
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

  void requestResponseMethod() {
    _connection.on("RequestAccepted", (arguments) {
      emit(ScooterRequestDriverAccepted());

      log("accepted stats:${arguments?.first.toString()}");
    });
    _connection.on("RequestRejected", (arguments) {
      log("rejected stats:${arguments?.first.toString()}");
    });
  }

  void cancelRequest() {
    emit(ScooterRequestInitial());
  }

  void _createNotification(RequestModel requestModel) {
    log(requestModel.toJson().toString());
    RequestDetails requestDetails = RequestDetails(
        requestId: requestModel.requestId!,
        location: requestModel.location!,
        destination: requestModel.destination!,
        price: requestModel.price.toString(),
        userName: "Mohamed Samir",
        paymentMethod: "cash");

    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: math.Random().nextInt(300),
            channelKey: notifChannelKey,
            actionType: ActionType.Default,
            payload: requestDetails.toJson(),
            title: 'Ride Request For You!',
            body:
                "from ${requestModel.location} to ${requestModel.destination}\n${requestModel.price} EGP",
            notificationLayout: NotificationLayout.Default,
            backgroundColor: pKcolor,
            wakeUpScreen: true
            // badge: 5,
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
        ]);
  }

  Future<void> closeConnection() async {
    await _connection.stop();
    log(" closeConnection :${_connection.state}");
  }

  Future<void> joinGroup(String groupName) async {
    try {
      await _connection.invoke('JoinGroup', args: <Object>[groupName]);
      emit(ScooterRequestSuccess());
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<void> toggleGroupMembership(String groupName) async {
    if (_isJoined) {
      await leaveGroup(groupName);
      emit(ScooterRequestInitial());

      _isJoined = false;
    } else {
      await joinGroup(groupName);
      recieveRequest();
      _isJoined = true;
    }
  }

  Future<void> leaveGroup(String groupName) async {
    try {
      await _connection.invoke('LeaveGroup', args: <Object>[groupName]);
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<void> sendRideRequest() async {
    userRequest.requestId = uuid.v4();
    userRequest.connectionId = _connection.connectionId;
    log(userRequest.toJson().toString());

    try {
      await _connection
          .invoke('SendRideRequest', args: <Object>[userRequest.toJson()]);
      emit(ScooterRequestSent(requestData: userRequest));
      // await acceptRequest(userRequest.requestId!);
      _connection.on("RequestAccepted", (arguments) {
        emit(ScooterRequestDriverAccepted());

        log("accepted stats:${arguments?.first.toString()}");
      });
      log("done sending");
    } on Exception catch (e) {
      log("error sending :${e.toString()}");
    }
  }

  Future<void> handleRecivedRequest(BuildContext context,
      {required ReceivedAction action}) async {
    if (action.buttonKeyPressed == "ACCEPT") {
      await acceptRequest(action.payload!["requestId"]!);
      emit(ScooterRequestAccepted(
          requestData: RequestDetails.fromJson(action.payload!)));
    } else if (action.buttonKeyPressed == "REJECT") {
      _rejectRequest(action.payload!["requestId"]!);
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

  Future<void> acceptRequest(String requestId,
      {RequestDetails? requestDetails}) async {
    String driverConnectionId = _connection.connectionId!;
    try {
      await _connection.invoke('AcceptRequest',
          args: <Object>[requestId, driverConnectionId]);
      if (requestDetails != null) {
        emit(ScooterRequestAccepted(requestData: requestDetails));
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<void> _rejectRequest(String requestId) async {
    String driverConnectionId = _connection.connectionId!;

    try {
      await _connection.invoke('RejectRequest',
          args: <Object>[requestId, driverConnectionId]);
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
