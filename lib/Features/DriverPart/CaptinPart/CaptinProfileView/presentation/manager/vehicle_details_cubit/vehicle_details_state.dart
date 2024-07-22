part of 'vehicle_details_cubit.dart';

sealed class VehicleDetailsState extends Equatable {
  const VehicleDetailsState();

  @override
  List<Object> get props => [];
}

final class VehicleDetailsInitial extends VehicleDetailsState {}

final class VehicleDetailsLoading extends VehicleDetailsState {}

final class VehicleDetailsSuccess extends VehicleDetailsState {
  final VehicleDetaislModel detaislModel;

  const VehicleDetailsSuccess({required this.detaislModel});
}

final class VehicleDetailsFailure extends VehicleDetailsState {
  final String errMsg;

  const VehicleDetailsFailure({required this.errMsg});
}
