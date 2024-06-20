part of 'add_fav_cubit.dart';

sealed class AddFavState extends Equatable {
  const AddFavState();

  @override
  List<Object> get props => [];
}

final class AddFavInitial extends AddFavState {}

final class AddFavLoading extends AddFavState {}

final class AddFavSuccess extends AddFavState {
  final bool isADD;

  const AddFavSuccess({this.isADD = false});
}

final class AddFavFailure extends AddFavState {
  final String errMsg;

  const AddFavFailure({required this.errMsg});
}
