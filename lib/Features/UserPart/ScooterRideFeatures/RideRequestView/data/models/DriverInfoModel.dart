class DriverInfoModel {
  String? driverImg;
  String? driverName;
  String? rating;
  String? phoneNumber;
  String? scooterType;
  String? scooterColor;
  String? licensePlate;
  String? src;
  String? dst;
  String? price;

  DriverInfoModel({
    this.driverImg,
    this.driverName,
    this.rating,
    this.phoneNumber,
    this.scooterType,
    this.scooterColor,
    this.licensePlate,
    this.src,
    this.dst,
    this.price,
  });

  // Factory method to create an instance of RideDetails from a map (JSON)
  factory DriverInfoModel.fromJson(Map<String, dynamic> json) {
    return DriverInfoModel(
      driverImg: json['driverImg'] as String?,
      driverName: json['driverName'] as String?,
      rating: json['rating'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      scooterType: json['scooterType'] as String?,
      scooterColor: json['scooterColor'] as String?,
      licensePlate: json['licensePlate'] as String?,
      src: json['src'] as String?,
      dst: json['dst'] as String?,
      price: json['price'] as String?,
    );
  }

  // Method to convert RideDetails instance to a map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'driverImg': driverImg,
      'rating': rating,
      'phoneNumber': phoneNumber,
      'scooterType': scooterType,
      'scooterColor': scooterColor,
      'licensePlate': licensePlate,
      'src': src,
      'dst': dst,
      'price': price,
    };
  }
}
