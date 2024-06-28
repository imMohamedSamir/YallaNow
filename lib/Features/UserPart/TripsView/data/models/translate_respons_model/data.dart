import 'translation.dart';

class Data {
  List<Translation>? translations;

  Data({this.translations});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        translations: (json['translations'] as List<dynamic>?)
            ?.map((e) => Translation.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'translations': translations?.map((e) => e.toJson()).toList(),
      };
}
