import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/data/Repo/FavoriteRepo.dart';
import 'package:yallanow/Features/UserPart/FavoriteView/data/models/fav_details_model/fav_details_model.dart';

part 'fav_details_state.dart';

class FavDetailsCubit extends Cubit<FavDetailsState> {
  FavDetailsCubit(this.favoriteRepo) : super(FavDetailsInitial());
  final FavoriteRepo favoriteRepo;
  void get() async {
    emit(FavDetailsLoading());
    var results = await favoriteRepo.getFav();
    results.fold((faile) => emit(FavDetailsFailuer(errMsg: faile.errMessage)),
        (faveDetails) => emit(FavDetailsSuccess(favDetailsModel: faveDetails)));
  }
}
