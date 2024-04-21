part of 'auto_complete_places_cubit.dart';

sealed class AutoCompletePlacesState {}

final class AutoCompletePlacesInitial extends AutoCompletePlacesState {}

final class AutoCompletePlacesFailure extends AutoCompletePlacesState {
  final String errmsg;

  AutoCompletePlacesFailure({required this.errmsg});
}

final class AutoCompletePlacesLoading extends AutoCompletePlacesState {}

final class AutoCompletePlacesSucssess extends AutoCompletePlacesState {
  final List<PlaceModel> places;

  AutoCompletePlacesSucssess({required this.places});
}
