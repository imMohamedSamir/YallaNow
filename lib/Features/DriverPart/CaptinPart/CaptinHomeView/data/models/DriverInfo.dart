class DriverInfo {
  String? driverId;
  double? latitude;
  double? longitude;
  String? vehicleType;

  DriverInfo({
    this.driverId,
    this.latitude,
    this.longitude,
    this.vehicleType,
  });

  // Factory constructor to create an instance from a JSON map
  factory DriverInfo.fromJson(Map<String, dynamic> json) => DriverInfo(
        driverId: json['driverId'] as String?,
        latitude: json['latitude'] as double?,
        longitude: json['longitude'] as double?,
        vehicleType: json['vehicleType'] as String?,
      );

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() => {
        'driverId': driverId,
        'latitude': latitude,
        'longitude': longitude,
        'vehicleType': vehicleType,
      };

  @override
  String toString() {
    return 'DriverInfo(driverId: $driverId, latitude: $latitude, longitude: $longitude, vehicleType: $vehicleType)';
  }
}
