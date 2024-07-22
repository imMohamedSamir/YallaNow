import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/data/models/captin_drawer_details_model.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/data/repo/CatpinProfileRepo.dart';

part 'captin_drawer_state.dart';

class CaptinDrawerCubit extends Cubit<CaptinDrawerState> {
  CaptinDrawerCubit(this._catpinProfileRepo) : super(CaptinDrawerInitial());
  final CatpinProfileRepo _catpinProfileRepo;
  void get() async {
    emit(CaptinDrawerLoading());
    var result = await _catpinProfileRepo.captinDrawer();
    result.fold(
        (fail) => emit(CaptinDrawerFailure(message: fail.errMessage)),
        (detailsModel) =>
            emit(CaptinDrawerSuccess(detailsModel: detailsModel)));
  }
}
