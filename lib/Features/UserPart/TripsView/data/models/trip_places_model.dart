class TripPlacesModel {
  String? name;
  String? avatar;
  List<dynamic>? images;
  String? description;

  TripPlacesModel({this.name, this.avatar, this.images, this.description});

  factory TripPlacesModel.fromJson(Map<String, dynamic> json) {
    return TripPlacesModel(
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      images: json['images'] as List<dynamic>?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'avatar': avatar,
        'images': images,
        'description': description,
      };
}
