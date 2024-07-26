import 'dart:io';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/manager/DriverFileMangement.dart';

class DriverRegisterModel {
  String? firstName;
  String? lastName;
  String? nIDcard;
  String? email;
  String? password;
  String? phoneNumber;
  String? gender;
  String? fileName;
  bool? driverType;
  FileDetails? driverPapers;
  File? driverImg;
  String? licensePlate;
  int? vehicleType;
  String? vehicleColor;
  String? vehicleModel;
  String? vehicleYear;
  String? address;
  List<File?>? vehicleImg;

  DriverRegisterModel(
      {this.firstName,
      this.lastName,
      this.nIDcard,
      this.email,
      this.address,
      this.password,
      this.phoneNumber,
      this.gender,
      this.fileName,
      this.driverType,
      this.driverPapers,
      this.driverImg,
      this.licensePlate,
      this.vehicleType,
      this.vehicleColor,
      this.vehicleModel,
      this.vehicleYear,
      this.vehicleImg});

  factory DriverRegisterModel.fromJson(Map<String, dynamic> json) =>
      DriverRegisterModel(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        nIDcard: json['nIDcard'] as String?,
        email: json['email'] as String?,
        address: json['address'] as String?,
        password: json['password'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        gender: json['gender'] as String?,
        fileName: json['fileName'] as String?,
        driverType: json['driverType'] as bool?,
        licensePlate: json['licensePlate'] as String?,
        vehicleType: json['vehicleType'] as int?,
        vehicleColor: json['vehicleColor'] as String?,
        vehicleModel: json['vehicleModel'] as String?,
        vehicleYear: json['vehicleYear'] as String?,
      );

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'nIDcard': nIDcard,
      'email': email,
      'address': address,
      'password': password,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'fileName': fileName,
      'driverType': driverType,
      'driverPapers': driverPapers?.toJson(),
      'driverImg': driverImg?.path,
      'licensePlate': licensePlate,
      'vehicleType': vehicleType,
      'vehicleColor': vehicleColor,
      'vehicleModel': vehicleModel,
      'vehicleYear': vehicleYear,
      'vehicleImg': vehicleImg?.map((file) => file?.path).toList(),
    };
  }
}
