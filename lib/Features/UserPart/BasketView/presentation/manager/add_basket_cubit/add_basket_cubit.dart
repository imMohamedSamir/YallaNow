import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/Repo/BasketRepo.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/basket_item_model/BasketItemExtra.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/basket_item_model/BasketItemSize.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/basket_item_model/basket_item_model.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';

part 'add_basket_state.dart';

class AddBasketCubit extends Cubit<AddBasketState> {
  AddBasketCubit(this.basketRepo) : super(AddBasketInitial());
  final BasketRepo basketRepo;
  void add() async {
    List<BasketItemModel> basketItems = [];
    basketItems = parseItems();
    emit(AddBasketLoading());
    var results = await basketRepo.fetchResturantBranches(items: basketItems);
    results.fold((faile) => emit(AddBasketFailure(errmsg: faile.errMessage)),
        (done) => emit(AddBasketSuccess()));
  }

  List<BasketItemModel> parseItems() {
    List<SelectedItemsModel> selectedItems =
        Hive.box<SelectedItemsModel>(kBasket).values.toList();
    List<BasketItemModel> basketItems = [];

    if (selectedItems.isNotEmpty) {
      for (var item in selectedItems) {
        List<BasketItemSize>? sizes = [];
        List<BasketItemExtra>? extras = [];

        if (item.size != null) {
          sizes.add(
              BasketItemSize(name: item.size!.name, price: item.size!.price));
        }

        if (item.extras != null && item.extras!.isNotEmpty) {
          for (var extra in item.extras!) {
            extras.add(BasketItemExtra(
                name: extra.name, price: extra.price?.toDouble()));
          }
        }

        BasketItemModel basketItem = BasketItemModel(
          productId: item.itemID,
          partnerId: item.partnerID,
          partnerType: item.partnerType,
          price: double.parse(item.price),
          quantity: int.parse(item.quantity!),
          itemSizes: sizes,
          itemExtras: extras,
        );

        basketItems.add(basketItem);
      }
    }

    return basketItems;
  }
}
