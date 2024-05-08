import 'item.dart';

class MartDetailsModel {
  String? name;
  String? id;
  String? icon;
  List<MartItem>? items;

  MartDetailsModel({this.name, this.id, this.icon, this.items});

  factory MartDetailsModel.fromJson(Map<String, dynamic> json) {
    return MartDetailsModel(
      name: json['name'] as String?,
      id: json['id'] as String?,
      icon: json['icon'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => MartItem.fromJson(e as Map<String, dynamic>))
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
