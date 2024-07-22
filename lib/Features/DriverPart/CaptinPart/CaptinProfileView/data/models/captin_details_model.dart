class CaptinDetailsModel {
  String? imageUrl;
  String? riderName;
  String? number;
  String? rideType;
  int? totalTrips;
  double? walletBalance;
  String? phoneNumber;
  int? riderRating;
  int? totalKillos;
  String? address;

  CaptinDetailsModel({
    this.imageUrl,
    this.riderName,
    this.number,
    this.rideType,
    this.totalTrips,
    this.walletBalance,
    this.phoneNumber,
    this.riderRating,
    this.totalKillos,
    this.address,
  });

  factory CaptinDetailsModel.fromJson(Map<String, dynamic> json) {
    return CaptinDetailsModel(
      imageUrl: json['imageUrl'] as String?,
      riderName: json['riderName'] as String?,
      number: json['number'] as String?,
      rideType: json['rideType'] as String?,
      totalTrips: json['totalTrips'] as int?,
      walletBalance: json['walletBalance'] as double?,
      phoneNumber: json['phoneNumber'] as String?,
      riderRating: json['riderRating'] as int?,
      totalKillos: json['totalKillos'] as int?,
      address: json['address'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'imageUrl': imageUrl,
        'riderName': riderName,
        'number': number,
        'rideType': rideType,
        'totalTrips': totalTrips,
        'walletBalance': walletBalance,
        'phoneNumber': phoneNumber,
        'riderRating': riderRating,
        'totalKillos': totalKillos,
        'address': address,
      };
}
