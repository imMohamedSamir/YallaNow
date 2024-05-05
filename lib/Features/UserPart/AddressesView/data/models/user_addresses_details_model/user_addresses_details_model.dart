import 'contact.dart';

class UserAddressesDetailsModel {
  String? id;
  String? city;
  num? latitude;
  num? longitude;
  String? postalCode;
  String? street;
  Contact? contact;

  UserAddressesDetailsModel({
    this.id,
    this.city,
    this.latitude,
    this.longitude,
    this.postalCode,
    this.street,
    this.contact,
  });

  factory UserAddressesDetailsModel.fromJson(Map<String, dynamic> json) {
    return UserAddressesDetailsModel(
      id: json['id'] as String?,
      city: json['city'] as String?,
      latitude: json['latitude'] as num?,
      longitude: json['longitude'] as num?,
      postalCode: json['postalCode'] as String?,
      street: json['street'] as String?,
      contact: json['contact'] == null
          ? null
          : Contact.fromJson(json['contact'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'city': city,
        'latitude': latitude,
        'longitude': longitude,
        'postalCode': postalCode,
        'street': street,
        'contact': contact?.toJson(),
      };
}
