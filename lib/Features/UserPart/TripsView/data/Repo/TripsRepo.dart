import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/TripInfoModel.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_book_model.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_card_model.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_places_model.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_popular_model.dart';

abstract class TripsRepo {
  Future<Either<Failure, List<TripCardModel>>> getExplorTrips(
      {required int pageNumber, required int pageSize});
  Future<Either<Failure, List<PopularTripModel>>> getPopularTrips();
  Future<Either<Failure, List<TripPlacesModel>>> getPlaces();
  Future<Either<Failure, List<dynamic>>> getTypes();
  Future<Either<Failure, TripInfoModel>> getTrip({required String id});
  Future<Either<Failure, List<TripCardModel>>> getTripsByPlace(
      {required String dst});
  Future<Either<Failure, List<TripCardModel>>> getTripsByType(
      {required String type});
  Future<Either<Failure, dynamic>> tripBook(
      {required TripBookModel tripBookModel});
}
