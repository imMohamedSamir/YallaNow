class CaptinDetailsModel {
  String? imageUrl;
  String? riderName;
  String? scooterType;
  String? scooterColor;
  String? number;
  String? rideType;
  num? totalTrips;
  double? walletBalance;
  String? phoneNumber;
  List<dynamic>? vehicleImage;
  int? riderRating;
  int? totalKillos;
  String? address;

  CaptinDetailsModel({
    this.imageUrl,
    this.riderName,
    this.scooterType,
    this.scooterColor,
    this.number,
    this.rideType,
    this.totalTrips,
    this.walletBalance,
    this.phoneNumber,
    this.vehicleImage,
    this.riderRating,
    this.totalKillos,
    this.address,
  });

  factory CaptinDetailsModel.fromJson(Map<String, dynamic> json) =>
      CaptinDetailsModel(
        imageUrl: json['imageUrl'] as String?,
        riderName: json['riderName'] as String?,
        scooterType: json['scooterType'] as String?,
        scooterColor: json['scooterColor'] as String?,
        number: json['number'] as String?,
        rideType: json['rideType'] as String?,
        totalTrips: json['totalTrips'] as num?,
        walletBalance: json['walletBalance'] as double?,
        phoneNumber: json['phoneNumber'] as String?,
        vehicleImage: json['vehicleImage'] as List<dynamic>?,
        riderRating: json['riderRating'] as int?,
        totalKillos: json['totalKillos'] as int?,
        address: json['address'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'imageUrl': imageUrl,
        'riderName': riderName,
        'scooterType': scooterType,
        'scooterColor': scooterColor,
        'number': number,
        'rideType': rideType,
        'totalTrips': totalTrips,
        'walletBalance': walletBalance,
        'phoneNumber': phoneNumber,
        'vehicleImage': vehicleImage,
        'riderRating': riderRating,
        'totalKillos': totalKillos,
        'address': address,
      };
}
