class BasketItemExtra {
  String? name;
  double? price;

  BasketItemExtra({this.name, this.price});

  factory BasketItemExtra.fromJson(Map<String, dynamic> json) =>
      BasketItemExtra(
        name: json['name'] as String?,
        price: json['price'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
      };
}
