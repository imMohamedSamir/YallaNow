part of 'pharmacy_details_cubit.dart';

sealed class PharmacyDetailsState extends Equatable {
  const PharmacyDetailsState();

  @override
  List<Object> get props => [];
}

final class PharmacyDetailsInitial extends PharmacyDetailsState {}

final class PharmacyDetailsLoading extends PharmacyDetailsState {}

final class PharmacyDetailsSuccess extends PharmacyDetailsState {
  final List<PharmacyDetailsModel> pharmacyDetails;

  const PharmacyDetailsSuccess({required this.pharmacyDetails});
}

final class PharmacyDetailsFailure extends PharmacyDetailsState {
  final String errMsg;

  const PharmacyDetailsFailure({required this.errMsg});
}
