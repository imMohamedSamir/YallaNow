class PopularResturants {
  String? id;
  String? name;
  int? rate;
  String? deliveryTime;
  String? description;
  String? imageUrl;

  PopularResturants({
    this.id,
    this.name,
    this.rate,
    this.deliveryTime,
    this.description,
    this.imageUrl,
  });

  factory PopularResturants.fromJson(Map<String, dynamic> json) =>
      PopularResturants(
        id: json['id'] as String?,
        name: json['name'] as String?,
        rate: json['rate'] as int?,
        deliveryTime: json['deliveryTime'] as String?,
        description: json['description'] as String?,
        imageUrl: json['imageUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'rate': rate,
        'deliveryTime': deliveryTime,
        'description': description,
        'imageUrl': imageUrl,
      };
}
