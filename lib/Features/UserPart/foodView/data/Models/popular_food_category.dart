class PopularFoodCategory {
  String? type;
  String? name;
  String? imageUrl;
  String? desc;

  PopularFoodCategory({this.type, this.name, this.imageUrl, this.desc});

  factory PopularFoodCategory.fromJson(Map<String, dynamic> json) {
    return PopularFoodCategory(
      type: json['type'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      desc: json['desc'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'name': name,
        'imageUrl': imageUrl,
        'desc': desc,
      };
}
