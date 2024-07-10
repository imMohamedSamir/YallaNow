class CaptinRequestModel {
  String? destination;
  String? location;
  double? price;
  String? userId;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? paymentMethod;
  String? gender;
  String? tripId;

  CaptinRequestModel({
    this.destination,
    this.location,
    this.price,
    this.userId,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.paymentMethod,
    this.gender,
    this.tripId,
  });

  // Factory method to create an instance of Trip from a map
  factory CaptinRequestModel.fromMap(Map<String, dynamic> map) {
    return CaptinRequestModel(
      destination: map['Destination'] ?? '',
      location: map['Location'] ?? '',
      price: (map['Price'] ?? 0).toDouble(),
      userId: map['UserId'] ?? '',
      firstName: map['FirstName'] ?? '',
      lastName: map['LastName'] ?? '',
      phoneNumber: map['PhoneNumber'] ?? '',
      paymentMethod: map['PaymentMethod'] ?? '',
      gender: map['Gender'] ?? '',
      tripId: map['TripId'] ?? '',
    );
  }
  factory CaptinRequestModel.fromPayload(Map<String, String?> json) {
    return CaptinRequestModel(
      destination: json['Destination'] ?? '',
      location: json['Location'] ?? '',
      price: double.parse(json['Price'] ?? ""),
      userId: json['UserId'] ?? '',
      firstName: json['FirstName'] ?? '',
      lastName: json['LastName'] ?? '',
      phoneNumber: json['PhoneNumber'] ?? '',
      paymentMethod: json['PaymentMethod'] ?? '',
      gender: json['Gender'] ?? '',
      tripId: json['TripId'] ?? '',
    );
  }
  // Method to convert Trip instance to a map
  Map<String, dynamic> toMap() {
    return {
      'Destination': destination,
      'Location': location,
      'Price': price,
      'UserId': userId,
      'FirstName': firstName,
      'LastName': lastName,
      'PhoneNumber': phoneNumber,
      'PaymentMethod': paymentMethod,
      'Gender': gender,
      'TripId': tripId,
    };
  }
}
