import 'PharmacyItem.dart';

class PharmacyDetailsModel {
  String? name;
  String? id;
  String? icon;
  List<PharmacyItem>? items;

  PharmacyDetailsModel({this.name, this.id, this.icon, this.items});

  factory PharmacyDetailsModel.fromJson(Map<String, dynamic> json) {
    return PharmacyDetailsModel(
      name: json['name'] as String?,
      id: json['id'] as String?,
      icon: json['icon'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => PharmacyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'icon': icon,
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
