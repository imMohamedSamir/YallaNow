class LoginResponseModel {
  dynamic message;
  bool? isAuthenticated;
  String? username;
  String? email;
  List<dynamic>? roles;
  String? token;
  String? expiresOn;
  DateTime? refreshTokenExpiration;

  LoginResponseModel({
    this.message,
    this.isAuthenticated,
    this.username,
    this.email,
    this.roles,
    this.token,
    this.expiresOn,
    this.refreshTokenExpiration,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      message: json['message'] as dynamic,
      isAuthenticated: json['isAuthenticated'] as bool?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      roles: json['roles'] as List<dynamic>?,
      token: json['token'] as String?,
      expiresOn: json['expiresOn'] as String?,
      refreshTokenExpiration: json['refreshTokenExpiration'] == null
          ? null
          : DateTime.parse(json['refreshTokenExpiration'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'isAuthenticated': isAuthenticated,
        'username': username,
        'email': email,
        'roles': roles,
        'token': token,
        'expiresOn': expiresOn,
        'refreshTokenExpiration': refreshTokenExpiration?.toIso8601String(),
      };
}
