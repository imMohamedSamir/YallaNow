import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_card_model.dart';

abstract class TripsRemoteDataSource {
  Future<List<TripCardModel>> getTrips({required int pagenumber});
}

class TripsRemoteDataSourceImpl extends TripsRemoteDataSource {
  final YallaNowServices yallaNowServices;

  TripsRemoteDataSourceImpl({required this.yallaNowServices});
  @override
  Future<List<TripCardModel>> getTrips({required int pagenumber}) async {
    String endPoint = "Trips?pageNumber=$pagenumber&pageSize=5";

    try {
      var response = await yallaNowServices.get(endPoint: endPoint);
      List<TripCardModel> trips = [];
      for (var trip in response) {
        trips.add(TripCardModel.fromJson(trip));
      }
      saveTrips(trips: trips);
      return (trips);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return [];
      }
      return [];
    }
  }
}

void saveTrips({required List<TripCardModel> trips}) async {
  var box = Hive.box(kTrips);
  box.addAll(trips);
}
