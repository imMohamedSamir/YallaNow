class ProgramModel {
  String? title;
  String? description;

  ProgramModel({this.title, this.description});

  factory ProgramModel.fromJson(Map<String, dynamic> json) => ProgramModel(
        title: json['title'] as String?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
      };
}
