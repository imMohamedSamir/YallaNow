class RequestDetails {
  String? requestId;
  String? connectionId;
  String? location;
  String? destination;
  String? price;
  String? userName;
  String? paymentMethod;
  String? vehicleType;
  String? srcLat;
  String? srcLng;
  String? dstLat;
  String? dstLng;
  String? status;

  RequestDetails({
    this.requestId,
    this.connectionId,
    this.location,
    this.destination,
    this.price,
    this.userName,
    this.paymentMethod,
    this.vehicleType,
    this.srcLat,
    this.srcLng,
    this.dstLat,
    this.dstLng,
    this.status = "Pending",
  });

  factory RequestDetails.fromJson(Map<String, dynamic> json) {
    return RequestDetails(
      requestId: json['requestId'],
      connectionId: json['connectionId'],
      location: json['location'],
      destination: json['destination'],
      price: json['price'],
      userName: json['userName'],
      paymentMethod: json['paymentMethod'],
      vehicleType: json['vehicleType'],
      srcLat: json['srcLat'],
      srcLng: json['srcLng'],
      dstLat: json['dstLat'],
      dstLng: json['dstLng'],
      status: json['status'] ?? "Pending",
    );
  }

  // Method to convert a RequestModel to a JSON map
  Map<String, String> toJson() {
    return {
      'requestId': requestId ?? "",
      'connectionId': connectionId ?? "",
      'location': location ?? "",
      'destination': destination ?? "",
      'price': price ?? "",
      'userName': userName ?? "",
      'paymentMethod': paymentMethod ?? "",
      'vehicleType': vehicleType ?? "",
      'srcLat': srcLat ?? "",
      'srcLng': srcLng ?? "",
      'dstLat': dstLat ?? "",
      'dstLng': dstLng ?? "",
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
