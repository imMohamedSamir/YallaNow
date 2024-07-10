// enum PaymentMethod { cash, wallet, creditCard }

import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/check_payment_method_cubit/check_payment_method_cubit.dart';

enum RideStatus { pending, accepted, rejected, ongoing, completed, cancelled }

class RequestDetails {
  String? id;
  String? requestId;
  String? location;
  String? destination;
  String? price;
  String? userName;
  PaymentMethod? paymentMethod;
  String? vehicleType;
  double? srcLat;
  double? srcLng;
  double? dstLat;
  double? dstLng;
  List? driverResponses;
  String? acceptedDriverId;
  RideStatus? status;
  String? phoneNumber;

  RequestDetails({
    this.id,
    this.requestId,
    this.location,
    this.destination,
    this.price,
    this.userName,
    this.phoneNumber,
    this.paymentMethod,
    this.vehicleType,
    this.srcLat,
    this.srcLng,
    this.dstLat,
    this.dstLng,
    this.driverResponses = const [],
    this.acceptedDriverId,
    this.status = RideStatus.pending,
  });

  factory RequestDetails.fromJson(Map<String, dynamic> json) {
    return RequestDetails(
      requestId: json['requestId'],
      // connectionId: json['connectionId'],
      location: json['location'],
      destination: json['destination'],
      price: json['price'],
      userName: json['userName'],
      phoneNumber: json['phoneNumber'],
      paymentMethod: PaymentMethod.values[json['paymentMethod']],
      vehicleType: json['vehicleType'],
      srcLat: json['srcLat'],
      srcLng: json['srcLng'],
      dstLat: json['dstLat'],
      dstLng: json['dstLng'],
      status: RideStatus.values[json['status']],
    );
  }
  factory RequestDetails.fromPayload(Map<String, dynamic> json) {
    return RequestDetails(
      requestId: json['requestId'],
      // connectionId: json['connectionId'],
      location: json['location'],
      destination: json['destination'],
      price: json['price'],
      userName: json['userName'],
      phoneNumber: json['phoneNumber'],
      // paymentMethod: PaymentMethod.values[json['paymentMethod']],
      // vehicleType: json['vehicleType'],
      // srcLat: json['srcLat'],
      // srcLng: json['srcLng'],
      // dstLat: json['dstLat'],
      // dstLng: json['dstLng'],
      // status: RideStatus.values[json['status']],
    );
  }
  // Method to convert a RequestModel to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'requestId': requestId ?? "",
      // 'connectionId': connectionId ?? "",
      'location': location ?? "",
      'destination': destination ?? "",
      'price': price ?? "",
      'userName': userName ?? "",
      'phoneNumber': phoneNumber ?? "",
      'paymentMethod': paymentMethod!.name,
      'vehicleType': vehicleType ?? "",
      'srcLat': srcLat,
      'srcLng': srcLng,
      'dstLat': dstLat,
      'dstLng': dstLng,
      // "PhoneNumber": phoneNumber ?? ''
    };
  }

  Map<String, String> toPayload() {
    return {
      'requestId': requestId ?? "",
      // 'connectionId': connectionId ?? "",
      'location': location ?? "",
      'destination': destination ?? "",
      'price': price ?? "",
      'userName': userName ?? "",
      'phoneNumber': phoneNumber ?? "",
      'paymentMethod': paymentMethod!.name,
      'vehicleType': vehicleType ?? "",
      'srcLat': srcLat.toString(),
      'srcLng': srcLng.toString(),
      'dstLat': dstLat.toString(),
      'dstLng': dstLng.toString(),
      "PhoneNumber": phoneNumber ?? ''
    };
  }
}

class RideResponse {
  final String requestId;
  final String driverId;
  final String price;

  RideResponse({
    required this.requestId,
    required this.driverId,
    required this.price,
  });

  Map<String, dynamic> toJson() => {
        'requestId': requestId,
        'driverId': driverId,
        'price': price,
      };
}

class RideTrip {
  final String tripId;
  final String userId;
  final String driverId;
  final String location;
  final String destination;
  final String price;
  final String paymentMethod;
  final DateTime startTime;
  final String status;

  RideTrip({
    required this.tripId,
    required this.userId,
    required this.driverId,
    required this.location,
    required this.destination,
    required this.price,
    required this.paymentMethod,
    required this.startTime,
    required this.status,
  });

  Map<String, dynamic> toJson() => {
        'tripId': tripId,
        'userId': userId,
        'driverId': driverId,
        'location': location,
        'destination': destination,
        'price': price,
        'paymentMethod': paymentMethod,
        'startTime': startTime.toIso8601String(),
        'status': status,
      };
}
