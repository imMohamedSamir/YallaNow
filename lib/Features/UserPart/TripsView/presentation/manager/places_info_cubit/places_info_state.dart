part of 'places_info_cubit.dart';

sealed class PlacesInfoState extends Equatable {
  const PlacesInfoState();

  @override
  List<Object> get props => [];
}

final class PlacesInfoInitial extends PlacesInfoState {}

final class PlacesInfoLoading extends PlacesInfoState {}

final class PlacesInfoSuccess extends PlacesInfoState {
  final List<TripPlacesModel> places;

  const PlacesInfoSuccess({required this.places});
}

final class PlacesInfoFailure extends PlacesInfoState {
  final String errMsg;

  const PlacesInfoFailure({required this.errMsg});
}
