class ResturantBranchModel {
  String? id;
  String? name;
  dynamic address;
  int? rate;
  String? description;
  String? imageUrl;

  ResturantBranchModel({
    this.id,
    this.name,
    this.address,
    this.rate,
    this.description,
    this.imageUrl,
  });

  factory ResturantBranchModel.fromJson(Map<String, dynamic> json) {
    return ResturantBranchModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      address: json['address'] as dynamic,
      rate: json['rate'] as int?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address': address,
        'rate': rate,
        'description': description,
        'imageUrl': imageUrl,
      };
}
