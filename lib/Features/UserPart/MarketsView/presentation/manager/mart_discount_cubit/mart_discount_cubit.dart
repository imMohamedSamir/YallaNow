import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/Repo/MartsRepo.dart';
import 'package:yallanow/Features/UserPart/MarketsView/data/models/mart_details_model/item.dart';

part 'mart_discount_state.dart';

class MartDiscountCubit extends Cubit<MartDiscountState> {
  MartDiscountCubit(this._martsRepo) : super(MartDiscountInitial());
  final MartsRepo _martsRepo;
  void get() async {}
}
