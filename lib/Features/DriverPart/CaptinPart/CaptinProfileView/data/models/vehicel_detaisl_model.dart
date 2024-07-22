class VehicleDetaislModel {
  List<dynamic>? vehicleImage;
  String? plateNumbers;
  int? vehicleType;
  String? vehiclemodel;
  String? vehiclecolor;
  String? vehicleYear;

  VehicleDetaislModel({
    this.vehicleImage,
    this.plateNumbers,
    this.vehicleType,
    this.vehiclemodel,
    this.vehiclecolor,
    this.vehicleYear,
  });

  factory VehicleDetaislModel.fromJson(Map<String, dynamic> json) {
    return VehicleDetaislModel(
      vehicleImage: json['vehicleImage'] as List<dynamic>?,
      plateNumbers: json['plateNumbers'] as String?,
      vehicleType: json['vehicleType'] as int?,
      vehiclemodel: json['vehiclemodel'] as String?,
      vehiclecolor: json['vehiclecolor'] as String?,
      vehicleYear: json['vehicleYear'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'vehicleImage': vehicleImage,
        'plateNumbers': plateNumbers,
        'vehicleType': vehicleType,
        'vehiclemodel': vehiclemodel,
        'vehiclecolor': vehiclecolor,
        'vehicleYear': vehicleYear,
      };
}
