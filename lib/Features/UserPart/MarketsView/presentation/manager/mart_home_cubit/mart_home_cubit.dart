import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/Repo/MartsRepo.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/marts_model.dart';

part 'mart_home_state.dart';

class MartHomeCubit extends Cubit<MartHomeState> {
  MartHomeCubit(this.martsRepo) : super(MartHomeInitial());
  final MartsRepo martsRepo;
  void getMarts() async {
    emit(MartHomeLoading());
    var marts = await martsRepo.fetchMarts();
    marts.fold((fail) => emit(MartHomeFailure(errMsg: fail.errMessage)),
        (marts) => emit(MartHomeSuccess(marts: marts)));
  }
}
