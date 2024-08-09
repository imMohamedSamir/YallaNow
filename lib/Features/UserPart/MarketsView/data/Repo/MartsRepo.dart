import 'package:dartz/dartz.dart';
import 'package:yallanow/Core/Errors/Failurs.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/item.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/mart_details_model.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/marts_model.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/search_result_model.dart';

abstract class MartsRepo {
  Future<Either<Failure, List<MartsModel>>> fetchMarts();
  Future<Either<Failure, List<MartDetailsModel>>> fetchMartsDetails(
      {required String martID});
  Future<Either<Failure, List<MartItem>>> fetchMartsItems();
  Future<Either<Failure, List<SearchResultModel>>> martsSearch(
      {required String input});
}
