class Translation {
  String? translatedText;

  Translation({this.translatedText});

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        translatedText: json['translatedText'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'translatedText': translatedText,
      };
}
