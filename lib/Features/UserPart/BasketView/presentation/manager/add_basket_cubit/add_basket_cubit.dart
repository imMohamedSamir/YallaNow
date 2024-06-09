import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/Repo/BasketRepo.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/basket_item_model/BasketItemExtra.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/basket_item_model/BasketItemSize.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/basket_item_model/basket_item_model.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';

part 'add_basket_state.dart';

class AddBasketCubit extends Cubit<AddBasketState> {
  AddBasketCubit(this.basketRepo) : super(AddBasketInitial());
  final BasketRepo basketRepo;
  void add({required List<SelectedItemsModel> items}) async {
    List<BasketItemModel> basketItems = [];
    basketItems = parseItems(items: items);
    emit(AddBasketLoading());
    var results = await basketRepo.fetchResturantBranches(items: basketItems);
    results.fold((faile) => emit(AddBasketFailure(errmsg: faile.errMessage)),
        (done) => emit(AddBasketSuccess()));
  }

  List<BasketItemModel> parseItems({required List<SelectedItemsModel> items}) {
    List<BasketItemModel> basketItems = [];
    if (items.isNotEmpty) {
      for (var item in items) {
        List<BasketItemSize> sizes = [];
        List<BasketItemExtra> extras = [];
        if (item.size != null) {
          sizes.add(
              BasketItemSize(name: item.size?.name, price: item.size?.price));
        }
        if (item.extras != null) {
          if (item.extras!.isNotEmpty) {
            for (var extra in item.extras!) {
              extras.add(BasketItemExtra(
                  name: extra.name, price: extra.price!.toDouble()));
            }
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
