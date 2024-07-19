import 'external_auth_dto.dart';

class ExternalAuthModel {
  ExternalAuthData? externalAuthDto;
  String? gender;
  String? phoneNumber;
  String? password;

  ExternalAuthModel({
    this.externalAuthDto,
    this.gender,
    this.phoneNumber,
    this.password,
  });

  factory ExternalAuthModel.fromJson(Map<String, dynamic> json) {
    return ExternalAuthModel(
      externalAuthDto: json['externalAuthDto'] == null
          ? null
          : ExternalAuthData.fromJson(
              json['externalAuthDto'] as Map<String, dynamic>),
      gender: json['gender'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'externalAuthDto': externalAuthDto?.toJson(),
        'gender': gender,
        'phoneNumber': phoneNumber,
        'password': password,
      };
}
