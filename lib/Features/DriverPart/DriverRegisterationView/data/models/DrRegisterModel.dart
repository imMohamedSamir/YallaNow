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
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'email': email,
        'password': password,
        'phoneNumber': phoneNumber,
        'gender': gender,
      };
}
