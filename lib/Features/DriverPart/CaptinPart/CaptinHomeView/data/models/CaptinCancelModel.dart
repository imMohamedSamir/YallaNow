class CancelModel {
  String? tripId;
  bool? isUser;
  String? cancelationReason;

  CancelModel({this.tripId, this.cancelationReason, this.isUser = true});
  Map<String, dynamic> toJson() {
    return {
      'tripId': tripId,
      'isUser': isUser,
      'cancelationReason': cancelationReason,
    };
  }
}
