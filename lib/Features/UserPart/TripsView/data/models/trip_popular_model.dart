class PopularTripModel {
  String? name;
  String? imageUrl;
  int? price;
  String? destination;
  String? id;
  String? currency;

  PopularTripModel({
    this.name,
    this.imageUrl,
    this.price,
    this.destination,
    this.id,
    this.currency,
  });

  factory PopularTripModel.fromJson(Map<String, dynamic> json) {
    return PopularTripModel(
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      price: json['price'] as int?,
      destination: json['destination'] as String?,
      id: json['id'] as String?,
      currency: json['currency'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'imageUrl': imageUrl,
        'price': price,
        'destination': destination,
        'id': id,
        'currency': currency,
      };
}
