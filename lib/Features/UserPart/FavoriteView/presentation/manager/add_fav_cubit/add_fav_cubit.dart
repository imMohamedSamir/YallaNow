import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/data/Repo/FavoriteRepo.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/data/models/add_fav_model.dart';

part 'add_fav_state.dart';

class Add_Remove_FavCubit extends Cubit<AddFavState> {
  Add_Remove_FavCubit(this.favoriteRepo) : super(AddFavInitial());
  final FavoriteRepo favoriteRepo;
  void add({required AddFavModel favModel}) async {
    emit(AddFavLoading());
    var result = await favoriteRepo.addToFavorits(favModel: favModel);
    result.fold((faile) => emit(AddFavFailure(errMsg: faile.errMessage)),
        (response) => emit(const AddFavSuccess(isADD: true)));
  }

  void remove({required String favId}) async {
    emit(AddFavLoading());
    var result = await favoriteRepo.removeFav(favId: favId);
    result.fold((faile) => emit(AddFavFailure(errMsg: faile.errMessage)),
        (response) => emit(const AddFavSuccess(isADD: false)));
  }
}
