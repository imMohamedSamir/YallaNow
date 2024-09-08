import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/Repo/MartsRepo.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/OfferDetailsModel.dart';

part 'market_offer_state.dart';

class MarketOfferCubit extends Cubit<MarketOfferState> {
  MarketOfferCubit(this._martsRepo) : super(MarketOfferInitial());
  final MartsRepo _martsRepo;
  void get() async {}
}
