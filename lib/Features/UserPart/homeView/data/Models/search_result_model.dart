class SearchResultModel {
  String? id;
  String? type;
  String? name;
  int? rate;
  String? deliveryTime;
  String? description;
  String? imageUrl;
  int? deliveryFees;

  SearchResultModel({
    this.id,
    this.type,
    this.name,
    this.rate,
    this.deliveryTime,
    this.description,
    this.imageUrl,
    this.deliveryFees,
  });

  factory SearchResultModel.fromJson(Map<String, dynamic> json) {
    return SearchResultModel(
      id: json['id'] as String?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      rate: json['rate'] as int?,
      deliveryTime: json['deliveryTime'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      deliveryFees: json['deliveryFees'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'name': name,
        'rate': rate,
        'deliveryTime': deliveryTime,
        'description': description,
        'imageUrl': imageUrl,
        'deliveryFees': deliveryFees,
      };
}
