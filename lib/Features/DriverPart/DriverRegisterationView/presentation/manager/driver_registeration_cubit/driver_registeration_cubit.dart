import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/data/Repo/DriverRegisterationRepo.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/data/models/DrRegisterModel.dart';

part 'driver_registeration_state.dart';

class DriverRegisterationCubit extends Cubit<DriverRegisterationState> {
  DriverRegisterationCubit(this.driverRegisterationRepo)
      : super(DriverRegisterationInitial());
  final DriverRegisterationRepo driverRegisterationRepo;
  fetchDriverRegisteration({required DriverRegisterModel driverDetails}) async {
    emit(DriverRegisterationLoading());
    var result = await driverRegisterationRepo.fetchRegisteration(
        driverDetails: driverDetails);
    result.fold(
        (fail) => emit(DriverRegisterationFailure(errmsg: fail.errorMessage)),
        (success) => emit(DriverRegisterationSuccess()));
  }
}
