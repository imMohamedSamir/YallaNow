part of 'fav_details_cubit.dart';

sealed class FavDetailsState extends Equatable {
  const FavDetailsState();

  @override
  List<Object> get props => [];
}

final class FavDetailsInitial extends FavDetailsState {}

final class FavDetailsLoading extends FavDetailsState {}

final class FavDetailsSuccess extends FavDetailsState {
  final FavDetailsModel favDetailsModel;

  const FavDetailsSuccess({required this.favDetailsModel});
}

final class FavDetailsFailuer extends FavDetailsState {
  final String errMsg;

  const FavDetailsFailuer({required this.errMsg});
}
