import 'package:hive/hive.dart';

class UserProfileDetails extends HiveObject {
  String? email;
  String? firstName;
  String? lastName;
  dynamic phoneNumber;
  String? id;
  double? wallet;
  String? gender;

  UserProfileDetails(
      {this.email,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.id,
      this.wallet,
      this.gender});

  factory UserProfileDetails.fromJson(Map<String, dynamic> json) {
    return UserProfileDetails(
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phoneNumber: json['phoneNumber'] as dynamic,
      wallet: json['wallet'] as double?,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'gender': gender,
      };
}
