class HomeMartsModel {
  String? id;
  String? name;
  int? rate;
  String? deliveryTime;
  double? deliveryFee;
  String? description;
  String? imageUrl;

  HomeMartsModel({
    this.id,
    this.name,
    this.rate,
    this.deliveryTime,
    this.deliveryFee,
    this.description,
    this.imageUrl,
  });

  factory HomeMartsModel.fromJson(Map<String, dynamic> json) {
    return HomeMartsModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      rate: json['rate'] as int?,
      deliveryTime: json['deliveryTime'] as String?,
      deliveryFee: json['deliveryFee'] as double?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'rate': rate,
        'deliveryTime': deliveryTime,
        'deliveryFee': deliveryFee,
        'description': description,
        'imageUrl': imageUrl,
      };
}
