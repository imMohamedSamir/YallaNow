import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Core/utlis/functions/SavePartnerId.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/Repo/MartsRepo.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/mart_details_model.dart';

part 'mart_details_state.dart';

class MartDetailsCubit extends Cubit<MartDetailsState> {
  MartDetailsCubit(this.martsRepo) : super(MartDetailsInitial());
  final MartsRepo martsRepo;

  void getMartsDetails({required String martID}) async {
    emit(MartDetailsLoading());
    var results = await martsRepo.fetchMartsDetails(martID: martID);
    results.fold((fali) => emit(MartDetailsFailuer(errMsg: fali.errMessage)),
        (martsDetails) {
      savePartnerId(id: martID, type: 1);
      emit(MartDetailsSuccess(martsDetails: martsDetails));
    });
  }
}
