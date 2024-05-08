class MartItem {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  double? price;
  dynamic newPrice;
  dynamic oldPrice;
  dynamic discountPercentage;
  bool? availability;

  MartItem({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.price,
    this.newPrice,
    this.oldPrice,
    this.discountPercentage,
    this.availability,
  });

  factory MartItem.fromJson(Map<String, dynamic> json) => MartItem(
        id: json['id'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        imageUrl: json['imageUrl'] as String?,
        price: json['price'] as double?,
        newPrice: json['newPrice'] as dynamic,
        oldPrice: json['oldPrice'] as dynamic,
        discountPercentage: json['discountPercentage'] as dynamic,
        availability: json['availability'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'imageUrl': imageUrl,
        'price': price,
        'newPrice': newPrice,
        'oldPrice': oldPrice,
        'discountPercentage': discountPercentage,
        'availability': availability,
      };
}
