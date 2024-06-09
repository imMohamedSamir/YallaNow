class RideRequestModel {
  String? userId;
  String? currentLocation;
  String? destination;
  int? longitude;
  int? latitude;
  int? baseFee;
  int? additionalFee;

  RideRequestModel({
    this.userId,
    this.currentLocation,
    this.destination,
    this.longitude,
    this.latitude,
    this.baseFee,
    this.additionalFee,
  });

  factory RideRequestModel.fromJson(Map<String, dynamic> json) {
    return RideRequestModel(
      userId: json['userId'] as String?,
      currentLocation: json['currentLocation'] as String?,
      destination: json['destination'] as String?,
      longitude: json['longitude'] as int?,
      latitude: json['latitude'] as int?,
      baseFee: json['baseFee'] as int?,
      additionalFee: json['additionalFee'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'currentLocation': currentLocation,
        'destination': destination,
        'longitude': longitude,
        'latitude': latitude,
        'baseFee': baseFee,
        'additionalFee': additionalFee,
      };
}
