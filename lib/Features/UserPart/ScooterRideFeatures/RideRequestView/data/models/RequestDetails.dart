class RequestDetails {
  final String requestId;
  final String location;
  final String destination;
  final String price;
  final String userName;
  final String paymentMethod;
  final String? vehicleType;
  final String? srcLat;
  final String? srcLng;
  final String? dstLat;
  final String? dstLng;

  RequestDetails({
    required this.requestId,
    required this.location,
    required this.destination,
    required this.price,
    required this.userName,
    required this.paymentMethod,
    this.vehicleType,
    this.srcLat,
    this.srcLng,
    this.dstLat,
    this.dstLng,
  });

  factory RequestDetails.fromJson(Map<String, dynamic> json) {
    return RequestDetails(
      requestId: json['requestId'],
      location: json['location'],
      destination: json['destination'],
      price: json['price'],
      userName: json['userName'],
      paymentMethod: json['paymentMethod'],
    );
  }

  // Method to convert a RequestModel to a JSON map
  Map<String, String> toJson() {
    return {
      'requestId': requestId,
      'location': location,
      'destination': destination,
      'price': price,
      'userName': userName,
      'paymentMethod': paymentMethod,
    };
  }
}
