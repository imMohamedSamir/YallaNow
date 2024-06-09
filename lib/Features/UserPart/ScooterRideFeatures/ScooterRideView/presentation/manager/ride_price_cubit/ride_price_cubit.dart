import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/data/Repo/ScooterRideRepo.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/data/models/ride_prices_model.dart';

part 'ride_price_state.dart';

class RidePriceCubit extends Cubit<RidePriceState> {
  RidePriceCubit(this.scooterRideRepo) : super(RidePriceInitial());
  final ScooterRideRepo scooterRideRepo;
  void getPrices({required double distance}) async {
    emit(RidePriceInitial());
    distance = distance / 1000;
    var result = await scooterRideRepo.getRidePrice(distance: distance);
    result.fold((fail) => emit(RidePriceFailure(errMsg: fail.errMessage)),
        (prices) => emit(RidePriceSuccess(pricesModel: prices)));
  }
}
