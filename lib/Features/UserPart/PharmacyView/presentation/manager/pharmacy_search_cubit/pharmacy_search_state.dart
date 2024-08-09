part of 'pharmacy_search_cubit.dart';

sealed class PharmacySearchState extends Equatable {
  const PharmacySearchState();

  @override
  List<Object> get props => [];
}

final class PharmacySearchInitial extends PharmacySearchState {}

final class PharmacySearchLoading extends PharmacySearchState {}

final class PharmacySearchSuccess extends PharmacySearchState {
  final List<SearchResultModel> results;

  const PharmacySearchSuccess({required this.results});
}

final class PharmacySearchFailure extends PharmacySearchState {
  final String errMsg;

  const PharmacySearchFailure({required this.errMsg});
}
