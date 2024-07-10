class ReadyModel {
  String? id;
  String? deviceToken;
  double? currentLatitude;
  double? currentLongitude;

  ReadyModel({
    this.id,
    this.deviceToken,
    this.currentLatitude,
    this.currentLongitude,
  });

  factory ReadyModel.fromJson(Map<String, dynamic> json) => ReadyModel(
        id: json['id'] as String?,
        deviceToken: json['deviceToken'] as String?,
        currentLatitude: json['currentLatitude'] as double?,
        currentLongitude: json['currentLongitude'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'deviceToken': deviceToken,
        'currentLatitude': currentLatitude,
        'currentLongitude': currentLongitude,
      };
}
