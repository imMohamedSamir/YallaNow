class FavRestaurant {
  String? id;
  String? name;
  String? imageUrl;
  int? rate;
  String? description;
  String? deliveryTime;
  String? deliveryFees;

  FavRestaurant({
    this.id,
    this.name,
    this.imageUrl,
    this.rate,
    this.description,
    this.deliveryTime,
    this.deliveryFees,
  });

  factory FavRestaurant.fromJson(Map<String, dynamic> json) {
    return FavRestaurant(
      id: json['id'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      rate: json['rate'] as int?,
      description: json['description'] as String?,
      deliveryTime: json['deliveryTime'] as String?,
      deliveryFees: json['deliveryFees'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'rate': rate,
      'description': description,
      'deliveryTime': deliveryTime,
      'deliveryFees': deliveryFees,
    };
  }
}
