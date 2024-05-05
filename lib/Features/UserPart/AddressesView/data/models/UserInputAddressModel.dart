class UserInputAddressModel {
  String? country;
  String? state;
  String? city;
  String? street;
  String? postalCode;
  double? latitude;
  double? longitude;
  String? label;
  String? contactPhone;
  String? extraContactPhone;
  String? deliveryNotes;

  UserInputAddressModel({
    this.country,
    this.state,
    this.city,
    this.street,
    this.postalCode,
    this.latitude,
    this.longitude,
    this.label,
    this.contactPhone,
    this.extraContactPhone,
    this.deliveryNotes,
  });

  factory UserInputAddressModel.fromJson(Map<String, dynamic> json) {
    return UserInputAddressModel(
      country: json['country'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      street: json['street'] as String?,
      postalCode: json['postalCode'] as String?,
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
      label: json['label'] as String?,
      contactPhone: json['contactPhone'] as String?,
      extraContactPhone: json['extraContactPhone'] as String?,
      deliveryNotes: json['deliveryNotes'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'country': country,
        'state': state,
        'city': city,
        'street': street,
        'postalCode': postalCode,
        'latitude': latitude,
        'longitude': longitude,
        'label': label,
        'contactPhone': contactPhone,
        'extraContactPhone': extraContactPhone,
        'deliveryNotes': deliveryNotes,
      };
}
