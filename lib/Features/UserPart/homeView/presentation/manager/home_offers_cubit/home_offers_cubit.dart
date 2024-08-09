import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Repo/HomeRepo.dart';

part 'home_offers_state.dart';

class HomeOffersCubit extends Cubit<HomeOffersState> {
  HomeOffersCubit(this._homeRepo) : super(HomeOffersInitial());
  final HomeRepo _homeRepo;
  void getHomeOffers() async {}
}
