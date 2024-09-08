import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/SavePartnerId.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/restrunt_details/restrunt_details.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Repo/FoodRepo.dart';

part 'ResturantDetailsesState.dart';

class ResturantDetailsCubit extends Cubit<ResturantDetailsesState> {
  ResturantDetailsCubit(this.foodRepo) : super(ResturantBranchesInitial());
  final FoodRepo foodRepo;
  void get({required String restaurantId}) async {
    emit(ResturantDetailsLoading());
    var results =
        await foodRepo.fetchResturantDetails(restaurantId: restaurantId);

    results
        .fold((fail) => emit(ResturantDetailsFailure(errmsg: fail.errMessage)),
            (branchDetails) {
      savePartnerId(id: restaurantId, type: resturantType);
      emit(ResturantDetailsSuccess(branchDetails: branchDetails));
    });
  }
}
