class BasketItemSize {
  String? name;
  double? price;

  BasketItemSize({this.name, this.price});

  factory BasketItemSize.fromJson(Map<String, dynamic> json) => BasketItemSize(
        name: json['name'] as String?,
        price: json['price'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
      };
}
