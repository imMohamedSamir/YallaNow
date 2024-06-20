class AddFavModel {
  String? partnerId;
  int? partnerType;
  bool? isFavorite;

  AddFavModel({this.partnerId, this.partnerType, this.isFavorite});

  factory AddFavModel.fromJson(Map<String, dynamic> json) => AddFavModel(
        partnerId: json['partnerId'] as String?,
        partnerType: json['partnerType'] as int?,
        isFavorite: json['isFavorite'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'partnerId': partnerId,
        'partnerType': partnerType,
        'isFavorite': isFavorite,
      };
}
