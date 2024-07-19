import 'ride_history.dart';

class CaptinTripsModel {
  List<RideHistory>? rideHistory;
  List<dynamic>? totalData;

  CaptinTripsModel({this.rideHistory, this.totalData});

  factory CaptinTripsModel.fromJson(Map<String, dynamic> json) {
    return CaptinTripsModel(
      rideHistory: (json['rideHistory'] as List<dynamic>?)
          ?.map((e) => RideHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalData: json['totalData'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
        'rideHistory': rideHistory?.map((e) => e.toJson()).toList(),
        'totalData': totalData,
      };
}
