part of 'top_categ_resturant_cubit.dart';

sealed class TopCategResturantState extends Equatable {
  const TopCategResturantState();

  @override
  List<Object> get props => [];
}

final class TopCategResturantInitial extends TopCategResturantState {}

final class TopCategResturantSuccess extends TopCategResturantState {
  final List<TopCategResturant> resturants;

  TopCategResturantSuccess({required this.resturants});
}

final class TopCategResturantLoading extends TopCategResturantState {}

final class TopCategResturantFailure extends TopCategResturantState {
  final String errmsg;

  TopCategResturantFailure({required this.errmsg});
}
