class RideRatingModel {
  String? tripId;
  int? driverRate;
  int? tripRate;
  String? note;

  RideRatingModel({
    this.tripId,
    this.tripRate,
    this.note,
  });

  factory RideRatingModel.fromJson(Map<String, dynamic> json) {
    return RideRatingModel(
      tripId: json['tripId'] as String?,
      tripRate: json['rate'] as int?,
      note: json['note'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'tripId': tripId,
        'rate': driverRate,
        // 'tripRate': tripRate,
        'note': note,
      };
}
