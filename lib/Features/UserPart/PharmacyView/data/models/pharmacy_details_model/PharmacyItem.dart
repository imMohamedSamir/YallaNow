class PharmacyItem {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  double? price;
  num? newPrice;
  num? oldPrice;
  num? discountPercentage;
  bool? availability;

  PharmacyItem({
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

  factory PharmacyItem.fromJson(Map<String, dynamic> json) => PharmacyItem(
        id: json['id'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        imageUrl: json['imageUrl'] as String?,
        price: json['price'] as double?,
        newPrice: json['newPrice'] as num?,
        oldPrice: json['oldPrice'] as num?,
        discountPercentage: json['discountPercentage'] as num?,
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
