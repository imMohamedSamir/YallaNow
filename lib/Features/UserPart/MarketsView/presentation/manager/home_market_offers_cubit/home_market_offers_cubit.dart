import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/Repo/MartsRepo.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/OfferDetailsModel.dart';

part 'home_market_offers_state.dart';

class HomeMarketOffersCubit extends Cubit<HomeMarketOffersState> {
  HomeMarketOffersCubit(this._martsRepo) : super(HomeMarketOffersInitial());
  final MartsRepo _martsRepo;
  void get() async {}
}
