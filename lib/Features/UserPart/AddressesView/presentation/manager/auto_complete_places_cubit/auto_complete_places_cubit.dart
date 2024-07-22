import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/Repo/AddressRepo.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/manager/scooter_location_cubit/scooter_location_cubit.dart';

part 'auto_complete_places_state.dart';

class AutoCompletePlacesCubit extends Cubit<AutoCompletePlacesState> {
  AutoCompletePlacesCubit(this.addressesRepo)
      : super(AutoCompletePlacesInitial());
  final AddressesRepo addressesRepo;
  final TextEditingController sourceTextController = TextEditingController();
  final TextEditingController distanceTextController = TextEditingController();
  final FocusNode sourceFocusNode = FocusNode();
  final FocusNode destinationFocusNode = FocusNode();
  final Uuid uuid = const Uuid();
  String? sessionToken;
  void setSourceTextController(BuildContext context) {
    var currentLocation =
        BlocProvider.of<ScooterLocationCubit>(context).locationDetails;
    if (currentLocation != null) {
      sourceTextController.text =
          "${currentLocation.subAdministrativeArea} , ${currentLocation.locality} , ${currentLocation.street}";

      destinationFocusNode.requestFocus();
    }
  }

  // BlocProvider.of<AutoCompletePlacesCubit>(context)
  //             .destinationFocusNode
  //             .requestFocus();
  void getPlaces({required String input}) async {
    emit(AutoCompletePlacesLoading());
    sessionToken ??= uuid.v4();
    var results = await addressesRepo.getPredictions(
        input: input, sesstionToken: sessionToken);
    results.fold((faliure) {
      emit(AutoCompletePlacesFailure(errmsg: faliure.errMessage));
    }, (places) {
      emit(AutoCompletePlacesSucssess(places: places));
    });
  }

  void clearPlaces() {
    emit(AutoCompletePlacesInitial());
    // sourceTextController.clear();

    // close();
    // Emit initial state to clear places
  }
}
