import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/Repo/AddressRepo.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/place_autocomplete_model/place_autocomplete_model.dart';

part 'auto_complete_places_state.dart';

class AutoCompletePlacesCubit extends Cubit<AutoCompletePlacesState> {
  AutoCompletePlacesCubit(this.addressesRepo)
      : super(AutoCompletePlacesInitial());
  final AddressesRepo addressesRepo;
  final TextEditingController textEditingController = TextEditingController();

  void getPlaces({required String input}) async {
    emit(AutoCompletePlacesLoading());

    var results = await addressesRepo.getPredictions(input: input);
    results.fold((faliure) {
      emit(AutoCompletePlacesFailure(errmsg: faliure.errMessage));
    }, (places) {
      emit(AutoCompletePlacesSucssess(places: places));
    });
  }

  void clearPlaces() {
    emit(AutoCompletePlacesInitial());
    close();
    // Emit initial state to clear places
  }

  @override
  Future<void> close() {
    textEditingController.clear();
    textEditingController.dispose();
    return super.close();
  }
}
