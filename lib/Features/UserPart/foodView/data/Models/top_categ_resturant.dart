class TopCategResturant {
  String? name;
  String? imageUrl;
  String? desc;
  int? rate;
  String? deliverytime;

  TopCategResturant({
    this.name,
    this.imageUrl,
    this.desc,
    this.rate,
    this.deliverytime,
  });

  factory TopCategResturant.fromJson(Map<String, dynamic> json) {
    return TopCategResturant(
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      desc: json['desc'] as String?,
      rate: json['rate'] as int?,
      deliverytime: json['deliverytime'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'imageUrl': imageUrl,
        'desc': desc,
        'rate': rate,
        'deliverytime': deliverytime,
      };
}
