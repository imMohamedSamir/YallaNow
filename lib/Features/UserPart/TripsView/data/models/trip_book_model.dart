class TripBookModel {
  String? name;
  String? nationality;
  String? email;
  String? tripId;
  String? location;
  String? hotel;
  String? hotelRoom;
  String? phoneNumber;
  int? numberofjouniors;
  int? numberOfKids;
  int? numberOfAdults;

  TripBookModel({
    this.name,
    this.nationality,
    this.email,
    this.tripId,
    this.location,
    this.hotel,
    this.hotelRoom,
    this.phoneNumber,
    this.numberofjouniors,
    this.numberOfKids,
    this.numberOfAdults,
  });

  factory TripBookModel.fromJson(Map<String, dynamic> json) => TripBookModel(
        name: json['name'] as String?,
        nationality: json['nationality'] as String?,
        email: json['email'] as String?,
        tripId: json['tripId'] as String?,
        location: json['location'] as String?,
        hotel: json['hotel'] as String?,
        hotelRoom: json['hotelRoom'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        numberofjouniors: json['numberofjouniors'] as int?,
        numberOfKids: json['numberOfKids'] as int?,
        numberOfAdults: json['numberOfAdults'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'nationality': nationality,
        'email': email,
        'tripId': tripId,
        'location': location,
        'hotel': hotel,
        'hotelRoom': hotelRoom,
        'phoneNumber': phoneNumber,
        'numberofjouniors': numberofjouniors,
        'numberOfKids': numberOfKids,
        'numberOfAdults': numberOfAdults,
      };
}
