import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

part 'ride_request_state.dart';

class RideRequestCubit extends Cubit<RideRequestState> {
  RideRequestCubit() : super(RideRequestInitial());
  final HubConnection _connection = HubConnectionBuilder()
      .withUrl("https://yallanow.runasp.net/rideRequestHub")
      .build();

  void connect() async {
    try {
      if (_connection.state == HubConnectionState.Connected) {
        log(_connection.state.toString());
      } else {
        await _connection.start();
        log(_connection.state.toString());
      }

      // closeConnection();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> closeConnection() async {
    await _connection.stop();
    log(" closeConnection :${_connection.state}");
  }

  void listenerMethod() {
    _connection.on('ReceiveMessage', (arg) {
      if (arg == null) {
        log("no message received");
      }
      log(arg.toString());
    });
    _connection.on("ReceiveRideRequest", (arguments) {
      log(arguments.toString());
    });
  }

  Future<void> leaveGroup(String groupName) async {
    await _connection.invoke('LeaveGroup', args: <Object>[groupName]);
  }

  Future<void> joinGroup(String groupName) async {
    try {
      await _connection.invoke('JoinGroup', args: <Object>[groupName]);
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
