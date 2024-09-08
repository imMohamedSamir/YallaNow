import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Repo/FoodRepo.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/OfferDetailsModel.dart';

part 'food_offers_state.dart';

class FoodOffersCubit extends Cubit<FoodOffersState> {
  FoodOffersCubit(this._foodRepo) : super(FoodOffersInitial());
  final FoodRepo _foodRepo;
  void get() async {}
}
