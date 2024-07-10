import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:logging/logging.dart';
import 'package:signalr_netcore/signalr_client.dart';
import 'package:yallanow/Core/utlis/TokenManger.dart';
import 'package:yallanow/Core/utlis/functions/configureLogging.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/CaptinResponseModel.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/models/RequestDetails.dart';

class SignalRService {
  late HubConnection _connection;
  final StreamController<HubConnectionState> _connectionStateController =
      StreamController<HubConnectionState>.broadcast();

  final Logger _logger = Logger('SignalRService');

  SignalRService() {
    configureLogging();
    _connection = HubConnectionBuilder()
        .withUrl(
          _buildUrl(),
          options: HttpConnectionOptions(
            transport: HttpTransportType.WebSockets,
            requestTimeout: 5000,
            accessTokenFactory: () async => await _getAccessToken(),
          ),
        )
        .withAutomaticReconnect()
        .build();

    _setupConnectionHandlers();
  }

  String _buildUrl() {
    const baseUrl = 'https://yallanow.runasp.net';
    const hubEndpoint = '/ridehub';
    return '$baseUrl$hubEndpoint';
  }

  void _setupConnectionHandlers() {
    _connection.onclose(({error}) {
      _connectionStateController.add(HubConnectionState.Disconnected);
      _logger.warning('Connection closed: $error');
      if (error != null) {
        _logger.severe('Connection closed with error: ${error.toString()}');
      }
    });

    _connection.onreconnecting(({error}) {
      _connectionStateController.add(HubConnectionState.Reconnecting);
      _logger.info('Reconnecting: $error');
      if (error != null) {
        _logger.warning('Reconnecting with error: ${error.toString()}');
      }
    });

    _connection.onreconnected(({connectionId}) {
      _connectionStateController.add(HubConnectionState.Connected);
      _logger.info('Reconnected: $connectionId');
    });

    _connectionStateController.add(_connection.state!);
  }

  Stream<HubConnectionState> get connectionStateStream =>
      _connectionStateController.stream;

  HubConnectionState get connectionState => _connection.state!;

  HubConnection get connection => _connection;

  Future<String> _getAccessToken() async {
    String? token = await TokenManager.getUserToken();
    // _logger.fine('Access Token: $token');
    return token ?? "";
  }

  Future<Either<String, dynamic>> startConnection() async {
    try {
      await _connection.start();
      _logger.info('SignalR connection started');
      return right(null);
    } catch (e) {
      _connectionStateController.add(HubConnectionState.Disconnected);
      _logger.severe('Error starting SignalR connection: ${e.toString()}');
      if (e is HttpException) {
        _logger.warning('HTTP Error: ${e.message}');
        return left(e.toString());
      } else if (e is SocketException) {
        _logger.warning('Socket Error: ${e.message}');
        return left(e.toString());
      } else {
        _logger.warning('Unknown Error: $e');
        return left(e.toString());
      }
    }
  }

  Future<void> stopConnection() async {
    try {
      await _connection.stop();
      _connectionStateController.add(HubConnectionState.Disconnected);
      _logger.info('SignalR connection stopped');
    } catch (e) {
      _logger.warning('Error stopping SignalR connection: $e');
    }
  }

  // void received() {
  //   connection.on('ReceiveRideRequest', (request) {
  //     _logger.info('Received ride request: $request');
  //   });
  // }

  Future<Either<String, dynamic>> sendRideRequest(
      RequestDetails request) async {
    try {
      await _connection.invoke('SendRideRequest', args: [request]);
      return right(null);
    } catch (e) {
      _logger.warning('Error sending ride request: $e');
      return left(e.toString());
    }
  }

  Future<Either<String, dynamic>> respondToRideRequest(
      CaptinResponseModel response) async {
    try {
      await _connection.invoke('SendDriverResponse', args: [response]);
      _logger.info('Sent driver response: $response');
      return right(null);
    } catch (e) {
      _logger.warning('Error responding to ride request: $e');
      return left(e.toString());
    }
  }

  Future<Either<String, dynamic>> updateLocation(
      {required String driverId,
      required double latitude,
      required double longitude,
      required String vehicleType}) async {
    try {
      await _connection.invoke('UpdateDriverLocation',
          args: [driverId, latitude, longitude, vehicleType]);
      return right(null);
    } catch (e) {
      _logger.warning('Error updating location: $e');
      return left(e.toString());
    }
  }

  Future<Either<String, dynamic>> joinGroup(String groupName) async {
    try {
      await _connection.invoke('JoinGroup', args: [groupName]);
      _logger.info('Joined group: $groupName');
      return right(null);
    } catch (e) {
      _logger.warning('Error joining group: $e');
      return left(e.toString());
    }
  }

  Future<Either<String, dynamic>> leaveGroup(String groupName) async {
    try {
      await _connection.invoke('LeaveGroup', args: [groupName]);
      _logger.info('Left group: $groupName');
      return right(null);
    } catch (e) {
      _logger.warning('Error leaving group: $e');
      return left(e.toString());
    }
  }

  Future<void> endTrip(String tripId) async {
    try {
      await _connection.invoke('EndTrip', args: [tripId]);
      _logger.info('Ended trip with ID: $tripId');
    } catch (e) {
      _logger.warning('Error ending trip: $e');
    }
  }

  void dispose() {
    _connectionStateController.close();
  }
}
