class UserRequestModel {
  String? location;
  String? destination;
  String? price;
  int? paymentMethod;
  String? vehicleType;
  double? srcLat;
  double? srcLng;
  double? dstLat;
  double? dstLng;
  String? phoneNumber;
  String? username;
  String? deviceToken;

  UserRequestModel(
      {this.location,
      this.destination,
      this.price,
      this.paymentMethod,
      this.vehicleType,
      this.srcLat,
      this.srcLng,
      this.dstLat,
      this.dstLng,
      this.phoneNumber,
      this.username,
      this.deviceToken});

  factory UserRequestModel.fromJson(Map<String, dynamic> json) {
    return UserRequestModel(
        location: json['location'] as String?,
        destination: json['destination'] as String?,
        price: json['price'] as String?,
        paymentMethod: json['paymentMethod'] as int?,
        vehicleType: json['vehicleType'] as String?,
        srcLat: json['srcLat'] as double?,
        srcLng: json['srcLng'] as double?,
        dstLat: json['dstLat'] as double?,
        dstLng: json['dstLng'] as double?,
        username: json['username'] as String?,
        phoneNumber: json['phoneNumber'] as String);
  }
  factory UserRequestModel.fromPayload(Map<String, String?> json) {
    return UserRequestModel(
        location: json['location'],
        destination: json['destination'],
        price: json['price'],
        paymentMethod: json['paymentMethod'] as int?,
        vehicleType: json['vehicleType'],
        srcLat: json['srcLat'] as double?,
        srcLng: json['srcLng'] as double?,
        dstLat: json['dstLat'] as double?,
        dstLng: json['dstLng'] as double?,
        username: json['username'],
        phoneNumber: json['phoneNumber'] as String);
  }
  Map<String, dynamic> toJson() => {
        'location': location,
        'destination': destination,
        'price': price,
        'paymentMethod': paymentMethod,
        'vehicleType': vehicleType,
        'srcLat': srcLat,
        'srcLng': srcLng,
        'dstLat': dstLat,
        'dstLng': dstLng,
        'deviceId': deviceToken
      };
}
