import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/manager/DriverFileMangement.dart';

class DriverRegisterModel {
  String? firstName;
  String? lastName;
  String? username;
  String? nIDcard;
  String? email;
  String? password;
  String? phoneNumber;
  String? gender;
  String? fileName;
  bool? driverType;
  // String? contentType;
  // int? fileSize;
  // File? driverPapers; // New property to hold the file
  FileDetails? driverPapers;

  DriverRegisterModel({
    this.firstName,
    this.lastName,
    this.username,
    this.nIDcard,
    this.email,
    this.password,
    this.phoneNumber,
    this.gender,
    this.driverType,
    this.driverPapers,
  });

  factory DriverRegisterModel.fromJson(Map<String, dynamic> json) =>
      DriverRegisterModel(
          firstName: json['firstName'] as String?,
          lastName: json['lastName'] as String?,
          username: json['username'] as String?,
          email: json['email'] as String?,
          password: json['password'] as String?,
          phoneNumber: json['phoneNumber'] as String?,
          gender: json['gender'] as String?,
          driverType: json['DriverType'] as bool?);

  Map<String, dynamic> toJson() => {
        'FirstName': firstName,
        'LastName': lastName,
        'Username': username,
        'Email': email,
        'password': password,
        'PhoneNumber': phoneNumber,
        'Gender': gender,
        'DriverType': driverType
      };
}
