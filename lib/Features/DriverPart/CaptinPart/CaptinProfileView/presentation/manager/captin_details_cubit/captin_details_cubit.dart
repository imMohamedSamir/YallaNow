import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/data/models/captin_details_model.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/data/repo/CatpinProfileRepo.dart';

part 'captin_details_state.dart';

class CaptinDetailsCubit extends Cubit<CaptinDetailsState> {
  CaptinDetailsCubit(this._catpinProfileRepo) : super(CaptinDetailsInitial());
  final CatpinProfileRepo _catpinProfileRepo;
  void get() async {
    emit(CaptinDetailsLoading());
    var result = await _catpinProfileRepo.captinDetails();
    result.fold((fail) => emit(CaptinDetailsFailure(errMsg: fail.errMessage)),
        (captinModel) => emit(CaptinDetailsSuccess(captinModel: captinModel)));
  }
}
