class RequestModel {
  String? requestId;
  String? userId;
  String? location;
  String? destination;
  double? price;
  String? connectionId;
  String? status;
  String? lat;

  RequestModel(
      {this.requestId,
      this.userId,
      this.location,
      this.destination,
      this.price,
      this.connectionId,
      this.status,
      this.lat});

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
      requestId: json['requestId'] as String?,
      userId: json['userId'] as String?,
      location: json['location'] as String?,
      destination: json['destination'] as String?,
      price: json['price'] as double?,
      connectionId: json['connectionId'] as String?,
      status: json['status'] as String?,
      lat: json['lat'] as String?);

  Map<String, dynamic> toJson() => {
        'requestId': requestId,
        'userId': userId,
        'location': location,
        'destination': destination,
        'price': price,
        'connectionId': connectionId,
        'status': status,
        'lat': lat
      };
}
