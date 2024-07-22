import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/data/models/vehicel_detaisl_model.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/data/repo/CatpinProfileRepo.dart';

part 'vehicle_details_state.dart';

class VehicleDetailsCubit extends Cubit<VehicleDetailsState> {
  VehicleDetailsCubit(this._catpinProfileRepo) : super(VehicleDetailsInitial());
  final CatpinProfileRepo _catpinProfileRepo;
  void get() async {
    emit(VehicleDetailsLoading());
    var result = await _catpinProfileRepo.vehicleDetails();
    result.fold(
        (fail) => emit(VehicleDetailsFailure(errMsg: fail.errMessage)),
        (detailsModel) =>
            emit(VehicleDetailsSuccess(detaislModel: detailsModel)));
  }
}
