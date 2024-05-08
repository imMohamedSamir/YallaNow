import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/restrunt_details/restrunt_details.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Repo/FoodRepo.dart';

part 'resturant_branches_state.dart';

class ResturantBranchesCubit extends Cubit<ResturantBranchesState> {
  ResturantBranchesCubit(this.foodRepo) : super(ResturantBranchesInitial());
  final FoodRepo foodRepo;
  void fetchResturantBranches({required String restaurantId}) async {
    emit(ResturantBranchesLoading());
    var results =
        await foodRepo.fetchResturantBranches(restaurantId: restaurantId);

    results.fold(
        (fail) => emit(ResturantBranchesFailure(errmsg: fail.errMessage)),
        (branchDetails) =>
            emit(ResturantBranchesSuccess(branchDetails: branchDetails)));
  }
}
