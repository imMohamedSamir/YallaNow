part of 'pharmacies_home_cubit.dart';

sealed class PharmaciesHomeState extends Equatable {
  const PharmaciesHomeState();

  @override
  List<Object> get props => [];
}

final class PharmaciesHomeInitial extends PharmaciesHomeState {}

final class PharmaciesHomeLoading extends PharmaciesHomeState {}

final class PharmaciesHomeSuccess extends PharmaciesHomeState {
  final List<PharmacyModel> pharmacies;

  const PharmaciesHomeSuccess({required this.pharmacies});
}

final class PharmaciesHomeFailure extends PharmaciesHomeState {
  final String errMsg;

  const PharmaciesHomeFailure({required this.errMsg});
}
