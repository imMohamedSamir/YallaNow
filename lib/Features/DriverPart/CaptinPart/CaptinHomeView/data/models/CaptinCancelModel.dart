class CaptinCancelModel {
  String? tripId;
  String? cancelationReason;

  CaptinCancelModel({this.tripId, this.cancelationReason});
  Map<String, dynamic> toJson() {
    return {
      'tripId': tripId,
      'cancelationReason': cancelationReason,
    };
  }
}
