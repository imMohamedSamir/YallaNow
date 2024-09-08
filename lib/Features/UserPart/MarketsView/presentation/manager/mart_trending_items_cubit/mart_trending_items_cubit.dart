import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/Repo/MartsRepo.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/item.dart';

part 'mart_trending_items_state.dart';

class MartTrendingItemsCubit extends Cubit<MartTrendingItemsState> {
  MartTrendingItemsCubit(this._martsRepo) : super(MartTrendingItemsInitial());
  final MartsRepo _martsRepo;
  void get() async {}
}
