class TripInfoModel {
  String? id;
  String? imageUrl;
  String? name;
  String? description;
  String? destniation;
  String? duration;
  List<String>? userIds;
  int? price;
  String? currency;
  List<dynamic>? guides;
  List<dynamic>? contains;
  List<dynamic>? notContains;
  List<dynamic>? program;
  dynamic type;

  TripInfoModel({
    this.id,
    this.imageUrl,
    this.name,
    this.description,
    this.destniation,
    this.duration,
    this.userIds,
    this.price,
    this.currency,
    this.guides,
    this.contains,
    this.notContains,
    this.program,
    this.type,
  });

  factory TripInfoModel.fromJson(Map<String, dynamic> json) {
    return TripInfoModel(
      id: json['id'] as String?,
      imageUrl: json['imageUrl'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      destniation: json['destniation'] as String?,
      duration: json['duration'] as String?,
      // userIds: json['userIds'] as List<String>?,
      price: json['price'] as int?,
      currency: json['currency'] as String?,
      guides: json['guides'] as List<dynamic>?,
      contains: json['contains'] as List<dynamic>?,
      notContains: json['notContains'] as List<dynamic>?,
      program: json['program'] as List<dynamic>?,
      type: json['type'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'imageUrl': imageUrl,
        'name': name,
        'description': description,
        'destniation': destniation,
        'duration': duration,
        'userIds': userIds,
        'price': price,
        'currency': currency,
        'guides': guides,
        'contains': contains,
        'notContains': notContains,
        'program': program,
        'type': type,
      };
}
