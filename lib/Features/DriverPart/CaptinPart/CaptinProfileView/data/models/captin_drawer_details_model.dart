class CaptinDrawerDetailsModel {
  String? image;
  int? rating;
  String? name;

  CaptinDrawerDetailsModel({this.image, this.rating, this.name});

  factory CaptinDrawerDetailsModel.fromJson(Map<String, dynamic> json) {
    return CaptinDrawerDetailsModel(
      image: json['image'] as String?,
      rating: json['rating'] as int?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'image': image,
        'rating': rating,
        'name': name,
      };
}
