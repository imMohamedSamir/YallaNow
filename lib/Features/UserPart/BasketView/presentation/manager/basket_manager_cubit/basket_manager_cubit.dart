import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/savePartnerId.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';

part 'basket_manager_state.dart';

class BasketManagerCubit extends Cubit<BasketManagerState> {
  BasketManagerCubit() : super(BasketManagerInitial());
  double unitPrice = 0;
  bool sizeSelected = false;
  bool ismarket = false;
  double price = 0;
  double priceDetails = 0;
  String? partnerId;
  List<SelectedItemsModel> items = [];

  Future<double> getTotalPrice() async {
    double totalPrice = 0;
    var box = await Hive.openBox<SelectedItemsModel>(kBasket);
    for (var key in box.keys) {
      var item = box.get(key);
      if (item != null) {
        totalPrice += double.parse(item.price);
      }
    }
    return totalPrice;
  }

  void getCurrentItems() async {
    items.clear();
    var box = await Hive.openBox<SelectedItemsModel>(kBasket);
    // box.clear();
    for (var key in box.keys) {
      var item = box.get(key);
      if (item != null) {
        items.add(item);
      }
    }
  }

  Future<double> getTotalPriceDetails() async {
    double price = await getTotalPrice();
    price += 10;
    price += 5;
    return price;
  }

  void getBasketItems({bool isMart = false}) async {
    ismarket = isMart;
    List<SelectedItemsModel> basketItems = [];

    emit(BasketManagerInitial());
    var box = await Hive.openBox<SelectedItemsModel>(kBasket);
    // box.clear();
    for (var key in box.keys) {
      var item = box.get(key);
      if (item != null) {
        basketItems.add(item);
      }
    }
    double totalPrice = await getTotalPrice();
    priceDetails = await getTotalPriceDetails();

    bool isConfirm = totalPrice > 20;
    emit(BasketManagerChange(
        items: basketItems,
        totalPrice: totalPrice.toString(),
        priceDetails: priceDetails.toString(),
        isConfirmed: isConfirm));
  }

  void deleteFromBasket(String itemID) async {
    var box = Hive.box<SelectedItemsModel>(kBasket);
    await box.delete(itemID);
    emit(BasketManagerInitial());

    List<SelectedItemsModel> itemList = [];

    for (var key in box.keys) {
      var item = box.get(key);
      if (item != null) {
        itemList.add(item);
      }
    }
    price = await getTotalPrice();
    priceDetails = await getTotalPriceDetails();
    bool isConfirm = price > 20;

    emit(BasketManagerChange(
        items: itemList,
        totalPrice: price.toString(),
        priceDetails: priceDetails.toString(),
        isConfirmed: isConfirm));
  }

  void clearAndAdd({String? itemID}) async {
    var box = await Hive.openBox<SelectedItemsModel>(kBasket);
    for (var key in box.keys) {
      if (itemID != null && key != itemID) {
        await box.delete(key);
      }
    }
    var item = box.get(itemID);
    if (item != null) {
      partnerId = await getPartnerId();
      var updatedItem = SelectedItemsModel(
        itemID: item.itemID,
        partnerID: partnerId,

        name: item.name,
        price: item.price, // Update the price based on quantity
        img: item.img,
        quantity: item.quantity,
        size: item.size,
        extras: item.extras,
      );
      box.put(itemID, updatedItem);
      getBasketItems();
    }
  }

  void clearBasket() async {
    var box = await Hive.openBox<SelectedItemsModel>(kBasket);
    box.clear();
    getBasketItems();
  }

  void changeQty({required String itemId, required int number}) async {
    var box = await Hive.openBox<SelectedItemsModel>(kBasket);
    var item = box.get(itemId);
    if (item != null) {
      double currentUnitPrice =
          double.parse(item.price) / double.parse(item.quantity!);
      double updatedPrice = (currentUnitPrice * number).roundToDouble();
      var updatedItem = SelectedItemsModel(
        itemID: item.itemID,
        partnerID: partnerId,
        partnerType: item.partnerType,

        name: item.name,
        price: updatedPrice.toString(), // Update the price based on quantity
        img: item.img,
        quantity: number.toString(),
        size: item.size,
        extras: item.extras,
      );

      await box.put(itemId, updatedItem);
      getBasketItems();
    }
  }

  String getQty({required String itemId}) {
    var box = Hive.box<SelectedItemsModel>(kBasket);
    var item = box.get(itemId);
    return item?.quantity.toString() ?? '';
  }

  void initialize() {
    emit(BasketManagerInitial());
  }
}
