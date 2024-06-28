import 'data.dart';

class TranslateResponsModel {
  Data? data;

  TranslateResponsModel({this.data});

  factory TranslateResponsModel.fromJson(Map<String, dynamic> json) {
    return TranslateResponsModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
      };
}
