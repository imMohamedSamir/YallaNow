import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Core/utlis/YallaNowServices.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/Repo/TripsRepo.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/TripInfoModel.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_book_model.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_card_model.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_places_model.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_popular_model.dart';

class TripsRepoImpl implements TripsRepo {
  final YallaNowServices yallaNowServices;

  TripsRepoImpl({required this.yallaNowServices});
  @override
  Future<Either<Failure, List<TripCardModel>>> getExplorTrips(
      {required int pageNumber, required int pageSize}) async {
    String endPoint = "Trips?pageNumber=$pageNumber&pageSize=5";
    try {
      var response = await yallaNowServices.get(endPoint: endPoint);
      List<TripCardModel> trips = [];
      for (var trip in response) {
        trips.add(TripCardModel.fromJson(trip));
      }
      return right(trips);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e.type),
        );
      }

      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, TripInfoModel>> getTrip({required String id}) async {
    String endPoint = "Trips/$id";

    try {
      var response = await yallaNowServices.get(endPoint: endPoint);
      return right(TripInfoModel.fromJson(response));
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e.type),
        );
      }

      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<TripCardModel>>> getTripsByPlace(
      {required String dst}) async {
    String endPoint = "Trips/By Places?destination=$dst";

    try {
      var response = await yallaNowServices.get(endPoint: endPoint);
      List<TripCardModel> trips = [];
      for (var trip in response) {
        trips.add(TripCardModel.fromJson(trip));
      }
      return right(trips);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e.type),
        );
      }

      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<TripPlacesModel>>> getPlaces() async {
    String endPoint = "Trips/Places";

    try {
      var response = await yallaNowServices.get(endPoint: endPoint);
      List<TripPlacesModel> places = [];
      for (var place in response) {
        places.add(TripPlacesModel.fromJson(place));
      }
      return right(places);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e.type),
        );
      }

      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<PopularTripModel>>> getPopularTrips() async {
    String endPoint = "Trips/popular";

    try {
      var response = await yallaNowServices.get(endPoint: endPoint);
      List<PopularTripModel> trips = [];
      for (var place in response) {
        trips.add(PopularTripModel.fromJson(place));
      }
      return right(trips);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e.type),
        );
      }

      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<TripCardModel>>> getTripsByType(
      {required String type}) async {
    String endPoint = "Trips/By Type?Type=$type";

    try {
      var response = await yallaNowServices.get(endPoint: endPoint);
      List<TripCardModel> trips = [];
      for (var trip in response) {
        trips.add(TripCardModel.fromJson(trip));
      }
      return right(trips);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e.type),
        );
      }

      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List>> getTypes() async {
    String endPoint = "Trips/Types";

    try {
      var response = await yallaNowServices.get(endPoint: endPoint);
      List<dynamic> types = [];
      for (var type in response) {
        types.add(type);
      }
      return right(types);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e.type),
        );
      }

      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, dynamic>> tripBook(
      {required TripBookModel tripBookModel}) async {
    String endPoint = "UserTripsBooking";

    try {
      var response = await yallaNowServices.post(
          endPoint: endPoint, body: tripBookModel.toJson());
      log(response.toString());

      return right(response);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e.type),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
