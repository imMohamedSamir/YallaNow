import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/Repo/TripsRepo.dart';
import 'package:yallanow/Features/UserPart/TripsView/data/models/trip_book_model.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripBookSucces.dart';

part 'trip_book_state.dart';

class TripBookCubit extends Cubit<TripBookState> {
  TripBookCubit(this.tripsRepo) : super(TripBookInitial());
  final TripsRepo tripsRepo;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TripBookModel bookModel = TripBookModel();
  void book(BuildContext context) async {
    emit(TripBookLoading());
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var result = await tripsRepo.tripBook(tripBookModel: bookModel);
      result.fold((fail) => emit(TripBookFailure(errMsg: fail.errMessage)),
          (trip) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const TripBookSucces();
          },
        );
        emit(TripBookSuccess());
      });
    } else {
      // emit(TripBookFailure());
    }
  }
}
