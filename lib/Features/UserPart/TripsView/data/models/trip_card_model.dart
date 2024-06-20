import 'package:hive/hive.dart';

part 'trip_card_model.g.dart';

@HiveType(typeId: 7)
class TripCardModel extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? imageUrl;

  @HiveField(3)
  String? description;

  @HiveField(4)
  String? destniation;

  @HiveField(5)
  int? price;

  @HiveField(6)
  String? currency;

  TripCardModel({
    this.id,
    this.name,
    this.imageUrl,
    this.description,
    this.destniation,
    this.price,
    this.currency,
  });

  factory TripCardModel.fromJson(Map<String, dynamic> json) => TripCardModel(
        id: json['id'] as String?,
        name: json['name'] as String?,
        imageUrl: json['imageUrl'] as String?,
        description: json['description'] as String?,
        destniation: json['destniation'] as String?,
        price: json['price'] as int?,
        currency: json['currency'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imageUrl': imageUrl,
        'description': description,
        'destniation': destniation,
        'price': price,
        'currency': currency,
      };
}
