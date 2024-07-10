class CaptinResponseModel {
  bool? isAccepted;
  String? tripId;
  CaptinResponseModel({
    this.isAccepted,
    this.tripId,
  });

  factory CaptinResponseModel.fromJson(Map<String, dynamic> json) {
    return CaptinResponseModel(
      isAccepted: json['accept'],
      tripId: json['tripId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isAccepted': isAccepted,
      'tripId': tripId,
    };
  }
}
