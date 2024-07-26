class UserRegisterModel {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phoneNumber;
  String? gender;

  UserRegisterModel({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phoneNumber,
    this.gender,
  });

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) =>
      UserRegisterModel(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        gender: json['gender'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'phoneNumber': phoneNumber,
        'gender': gender,
      };
}
