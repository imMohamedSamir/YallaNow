import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/Repo/PharmacyRepo.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/OfferDetailsModel.dart';

part 'pharmacy_offers_state.dart';

class PharmacyOffersCubit extends Cubit<PharmacyOffersState> {
  PharmacyOffersCubit(this._pharmacyRepo) : super(PharmacyOffersInitial());
  final PharmacyRepo _pharmacyRepo;
  void get() async {}
}
