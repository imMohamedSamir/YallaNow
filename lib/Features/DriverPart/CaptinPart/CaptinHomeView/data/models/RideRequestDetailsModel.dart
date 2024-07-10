class RideRequestDetailsModel {
  final String message;
  final double currentLongitude;
  final double currentLatitude;
  final double dstLongitude;
  final double dstLatitude;

  RideRequestDetailsModel({
    required this.message,
    required this.currentLongitude,
    required this.currentLatitude,
    required this.dstLongitude,
    required this.dstLatitude,
  });

  // Factory method to create an instance of DriverResponse from a map (JSON)
  factory RideRequestDetailsModel.fromJson(Map<String, dynamic> json) {
    return RideRequestDetailsModel(
      message: json['message'] ?? '',
      currentLongitude: (json['currentLongitude'] as num).toDouble(),
      currentLatitude: (json['currentLatitude'] as num).toDouble(),
      dstLongitude: (json['dstLongitude'] as num).toDouble(),
      dstLatitude: (json['dstLatitude'] as num).toDouble(),
    );
  }

  // Method to convert DriverResponse instance to a map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'currentLongitude': currentLongitude,
      'currentLatitude': currentLatitude,
      'dstLongitude': dstLongitude,
      'dstLatitude': dstLatitude,
    };
  }
}
