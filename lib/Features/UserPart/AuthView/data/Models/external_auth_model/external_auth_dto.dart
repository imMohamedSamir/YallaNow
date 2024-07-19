class ExternalAuthData {
  String? provider;
  String? idToken;

  ExternalAuthData({this.provider, this.idToken});

  factory ExternalAuthData.fromJson(Map<String, dynamic> json) {
    return ExternalAuthData(
      provider: json['provider'] as String?,
      idToken: json['idToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'provider': provider,
        'idToken': idToken,
      };
}
