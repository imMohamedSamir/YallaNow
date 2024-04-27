import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';

part 'basket_manager_state.dart';

class BasketManagerCubit extends Cubit<BasketManagerState> {
  BasketManagerCubit() : super(BasketManagerInitial());

  void addToBasket(
      {required SelectedItemsModel item, required String itemID}) async {
    var box = await Hive.openBox<SelectedItemsModel>(kBasket);
    await box.put(itemID, item);
    log(box.get(itemID)!.name);
    emit(BasketManagerAdd());
  }

  void deleteFromBasket() {}
}
