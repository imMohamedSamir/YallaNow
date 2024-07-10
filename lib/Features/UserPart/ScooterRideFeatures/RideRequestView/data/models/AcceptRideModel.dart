class AcceptRideModel {
  final String destination;
  final String firstName;
  final String rating;
  final String licensePlate;
  final String vehicleType;
  final String gender;
  final String image;
  final String tripId;
  final String driverId;
  final String vehicleColor;
  final String phoneNumber;
  final String lastName;
  final String location;

  AcceptRideModel({
    required this.destination,
    required this.firstName,
    required this.rating,
    required this.licensePlate,
    required this.vehicleType,
    required this.gender,
    required this.image,
    required this.tripId,
    required this.driverId,
    required this.vehicleColor,
    required this.phoneNumber,
    required this.lastName,
    required this.location,
  });

  factory AcceptRideModel.fromJson(Map<String, dynamic> json) {
    return AcceptRideModel(
      destination: json['Destination'],
      firstName: json['FirstName'],
      rating: json['Rating'],
      licensePlate: json['LicensePlate'],
      vehicleType: json['VehicleType'],
      gender: json['Gender'],
      image: json['Image'],
      tripId: json['TripId'],
      driverId: json['DriverId'],
      vehicleColor: json['VehicleColor'],
      phoneNumber: json['PhoneNumber'],
      lastName: json['LastName'],
      location: json['Location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Destination': destination,
      'FirstName': firstName,
      'Rating': rating,
      'LicensePlate': licensePlate,
      'VehicleType': vehicleType,
      'Gender': gender,
      'Image': image,
      'TripId': tripId,
      'DriverId': driverId,
      'VehicleColor': vehicleColor,
      'PhoneNumber': phoneNumber,
      'LastName': lastName,
      'Location': location,
    };
  }
}
