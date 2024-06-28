class DriverResponse {
  String? driverId;
  String? price;
  bool? accept;
  String? requestId;

  DriverResponse({
    this.driverId,
    this.price,
    this.accept,
    this.requestId,
  });

  factory DriverResponse.fromJson(Map<String, dynamic> json) {
    return DriverResponse(
      driverId: json['driverId'],
      price: json['price'],
      accept: json['accept'],
      requestId: json['requestId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'driverId': driverId,
      'price': price,
      'accept': accept,
      'requestId': requestId,
    };
  }
}
