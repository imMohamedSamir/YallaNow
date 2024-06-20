import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_card_model.dart';

abstract class TripsLocalDataSource {
  Future<List<TripCardModel>> getTrips({required int pagenumber});
}

class TripsLocalDataSourceImpl {
  Future<List<TripCardModel>> getTrips({required int pagenumber}) async {
    await Hive.openBox<TripCardModel>(kTrips);
    var box = Hive.box<TripCardModel>(kTrips);
    int startindex = pagenumber * 5;
    int endindex = (pagenumber + 1) * 4;
    log(box.values.length.toString());
    List<TripCardModel> trips = [];
    if (box.values.isNotEmpty) {
      trips = box.values.toList().sublist(startindex, endindex);
    } else {
      trips = [];
    }
    int length = box.values.length;

    if (startindex >= 0 && startindex < length && endindex <= length) {
      if (endindex > startindex) {
        return trips;
      } else {
        log('Invalid range: endindex must be greater than startindex');
        return [];
      }
    } else {
      // Handle out-of-range condition, for example:

      log('Out of range: $startindex - $endindex');
      return [];
    }
  }
}
