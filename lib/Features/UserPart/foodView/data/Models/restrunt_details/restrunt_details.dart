import 'menu.dart';

class RestruntDetails {
  String? branchId;
  String? branchName;
  num? latitude;
  num? longitude;
  int? branchRate;
  String? branchDescription;
  String? branchImageUrl;
  List<Menu>? menus;

  RestruntDetails({
    this.branchId,
    this.branchName,
    this.latitude,
    this.longitude,
    this.branchRate,
    this.branchDescription,
    this.branchImageUrl,
    this.menus,
  });

  factory RestruntDetails.fromJson(Map<String, dynamic> json) {
    return RestruntDetails(
      branchId: json['branchId'] as String?,
      branchName: json['branchName'] as String?,
      latitude: json['latitude'] as num?,
      longitude: json['longitude'] as num?,
      branchRate: json['branchRate'] as int?,
      branchDescription: json['branchDescription'] as String?,
      branchImageUrl: json['branchImageUrl'] as String?,
      menus: (json['menus'] as List<dynamic>?)
          ?.map((e) => Menu.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'branchId': branchId,
        'branchName': branchName,
        'latitude': latitude,
        'longitude': longitude,
        'branchRate': branchRate,
        'branchDescription': branchDescription,
        'branchImageUrl': branchImageUrl,
        'menus': menus?.map((e) => e.toJson()).toList(),
      };
}
