import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/Repo/MartsRepo.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/item.dart';

part 'mart_items_state.dart';

class MartItemsCubit extends Cubit<MartItemsState> {
  MartItemsCubit(this.martsRepo) : super(MartItemsInitial());
  final MartsRepo martsRepo;
  void getItems() async {
    emit(MartItemsLoading());
    var items = await martsRepo.fetchMartsItems();
    items.fold((faile) => emit(MartItemsFailure(errMsg: faile.errMessage)),
        (items) => emit(MartItemsSuccess(items: items)));
  }
}
