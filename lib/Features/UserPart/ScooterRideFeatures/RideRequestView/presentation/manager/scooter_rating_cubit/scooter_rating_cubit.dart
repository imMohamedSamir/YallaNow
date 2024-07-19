import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/Repos/ScooterRequestRepo.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/data/models/ride_rating_model.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/HomePage.dart';

part 'scooter_rating_state.dart';

class ScooterRatingCubit extends Cubit<ScooterRatingState> {
  ScooterRatingCubit(this.scooterRequestRepo) : super(ScooterRatingInitial());
  final ScooterRequestRepo scooterRequestRepo;
  RideRatingModel rating = RideRatingModel();
  void send(BuildContext context) async {
    emit(ScooterRatingLoading());
    var result = await scooterRequestRepo.tripRating(rating: rating);
    result.fold((fail) => emit(ScooterRatingFailure(errmsg: fail.errMessage)),
        (respone) {
      emit(ScooterRatingSuccess());
      Navigator.pop(context);
      NavigateToPage.slideFromTop(context: context, page: const HomePage());
    });
  }
}
