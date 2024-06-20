class FavPharmacy {
  String? id;
  String? name;
  String? icon;
  String? description;
  String? deliveryTime;
  int? rate;
  double? deliveryFees;

  FavPharmacy({
    this.id,
    this.name,
    this.icon,
    this.description,
    this.deliveryTime,
    this.rate,
    this.deliveryFees,
  });

  factory FavPharmacy.fromJson(Map<String, dynamic> json) {
    return FavPharmacy(
      id: json['id'] as String?,
      name: json['name'] as String?,
      icon: json['icon'] as String?,
      description: json['description'] as String?,
      deliveryTime: json['deliveryTime'] as String?,
      rate: json['rate'] as int?,
      deliveryFees: json['deliveryFees'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'description': description,
      'deliveryTime': deliveryTime,
      'rate': rate,
      'deliveryFees': deliveryFees,
    };
  }
}
