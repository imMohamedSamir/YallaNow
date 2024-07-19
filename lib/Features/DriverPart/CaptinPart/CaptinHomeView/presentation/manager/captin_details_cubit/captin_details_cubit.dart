import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/Repo/CaptinRequestRepo.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/models/driver_details.dart';

part 'captin_details_state.dart';

class CaptinDetailsCubit extends Cubit<CaptinDetailsState> {
  CaptinDetailsCubit(this._captinRequestRepo) : super(CaptinDetailsInitial());
  final CaptinRequestRepo _captinRequestRepo;
  void get() async {
    emit(CaptinDetailsLoading());
    var result = await _captinRequestRepo.captinDetails();
    result.fold(
        (fail) => emit(CaptinDetailsFailure(errMsg: fail.errMessage)),
        (detailsModel) =>
            emit(CaptinDetailsSuccess(detailsModel: detailsModel)));
  }
}
