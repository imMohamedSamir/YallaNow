class UpdateLocationModel {
  String? driverId;
  double? latitude;
  double? longitude;

  UpdateLocationModel({this.driverId, this.latitude, this.longitude});

  factory UpdateLocationModel.fromJson(Map<String, dynamic> json) {
    return UpdateLocationModel(
      driverId: json['driverId'] as String?,
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
    );
  }

  Map<String, dynamic> toJson() => {
        'driverId': driverId,
        'latitude': latitude,
        'longitude': longitude,
      };
}
