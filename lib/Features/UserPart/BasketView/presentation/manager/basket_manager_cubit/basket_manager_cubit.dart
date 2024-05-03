import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/ExtraTypeModel.dart';

part 'basket_manager_state.dart';

class BasketManagerCubit extends Cubit<BasketManagerState> {
  BasketManagerCubit() : super(BasketManagerInitial());
  double unitPrice = 0;
  double _updatedExtraPrice = 0;
  bool sizeSelected = false;

  void createItem({required SelectedItemsModel itemsModel}) async {
    var box = await Hive.openBox<SelectedItemsModel>(kBasket);
    await box.put(itemsModel.itemID, itemsModel);

    var item = box.get(itemsModel.itemID);
    if (item != null) {
      var updatedItem = SelectedItemsModel(
        itemID: item.itemID,
        name: item.name,
        price: item.price, // Update the price based on quantity
        img: item.img,
        quantity: "1",
        size: item.size,
        extras: item.extras,
      );
      await box.put(itemsModel.itemID, updatedItem);
    }
  }

  Future<double> getTotalPrice() async {
    double totalPrice = 0;
    var box = await Hive.openBox<SelectedItemsModel>(kBasket);
    for (var key in box.keys) {
      var item = box.get(key);
      log(totalPrice.toString());
      if (item != null) {
        totalPrice += double.parse(item.price);
        log(totalPrice.toString());
      }
    }
    return totalPrice;
  }

  void addToBasket({required String itemID}) async {
    var box = await Hive.openBox<SelectedItemsModel>(kBasket);
    List<SelectedItemsModel> itemList = [];
    box.clear();
    if (!sizeSelected) {
      emit(BasketManagerIsSelected());
    } else {
      for (var key in box.keys) {
        var item = box.get(key);
        if (item != null) {
          itemList.add(item);
        }
      }
      double price = await getTotalPrice();

      emit(BasketManagerAdd(items: itemList, totalPrice: price.toString()));
    }
  }

  void deleteFromBasket(String itemID) async {
    var box = await Hive.openBox<SelectedItemsModel>(kBasket);
    await box.delete(itemID);
    emit(BasketManagerDelete());
  }

  void changeQty({required String itemID, required int number}) async {
    emit(BasketManagerInitial());

    var box = await Hive.openBox<SelectedItemsModel>(kBasket);
    var item = box.get(itemID);
    if (item != null) {
      double updatedPrice = 0;
      if (double.parse(item.price) > unitPrice * number) {
        updatedPrice = double.parse(item.price) - unitPrice;
        if (item.extras != null) {
          for (ExtraTypeModel extra in item.extras!) {
            double extraPrice = double.parse(extra.price);
            updatedPrice -= extraPrice * number;
          }
        }
      } else {
        updatedPrice = unitPrice * number;
        if (item.extras != null) {
          for (ExtraTypeModel extra in item.extras!) {
            double extraPrice = double.parse(extra.price);
            updatedPrice += extraPrice * number;
          }
        }
      }

      var updatedItem = SelectedItemsModel(
        itemID: item.itemID,
        name: item.name,
        price: updatedPrice.toString(), // Update the price based on quantity
        img: item.img,
        quantity: number.toString(),
        size: item.size,
        extras: item.extras,
      );

      await box.put(itemID, updatedItem);

      emit(BasketManagerChangeQty(price: updatedItem.price));
    }
  }

  void chooseSize({required String itemID, required String sizePrice}) async {
    emit(BasketManagerInitial());
    sizeSelected = true;
    var box = await Hive.openBox<SelectedItemsModel>(kBasket);
    unitPrice = double.parse(sizePrice);
    var item = box.get(itemID);
    double currentPrice = 0;
    double newsizePrice = 0;
    if (item != null) {
      currentPrice = double.parse(sizePrice) * int.parse(item.quantity!);
      if (item.extras != null) {
        newsizePrice = unitPrice * int.parse(item.quantity!);
        for (ExtraTypeModel extra in item.extras!) {
          double extraPrice = double.parse(extra.price);
          newsizePrice += extraPrice * int.parse(item.quantity!);
        }
      }
      var updatedItem = SelectedItemsModel(
        itemID: item.itemID,
        name: item.name,
        price: newsizePrice == 0
            ? currentPrice.toString()
            : newsizePrice.toString(), // Update the price based on quantity
        img: item.img,
        quantity: item.quantity,
        size: item.size,
        extras: item.extras,
      );

      await box.put(itemID, updatedItem);
      emit(BasketManagerSize(price: updatedItem.price));
      emit(BasketManagerChangeQty(price: updatedItem.price));
    }
  }

  void chooseExtra(
      {required String itemID,
      required String extraPrice,
      required List<ExtraTypeModel> extras}) async {
    emit(BasketManagerInitial());
    var box = await Hive.openBox<SelectedItemsModel>(kBasket);
    var item = box.get(itemID);

    if (item != null) {
      _updatedExtraPrice = double.parse(box.get(itemID)!.price) +
          (double.parse(extraPrice) * int.parse(item.quantity!));
      var updatedItem = SelectedItemsModel(
        itemID: item.itemID,
        name: item.name,
        price: _updatedExtraPrice.toString(),
        img: item.img,
        quantity: item.quantity,
        size: item.size,
        extras: extras,
      );

      await box.put(itemID, updatedItem);
      emit(BasketManagerSize(price: updatedItem.price));
      emit(BasketManagerChangeQty(price: updatedItem.price));
    }
  }

  void removeExtra(
      {required String itemID,
      required String extraPrice,
      required List<ExtraTypeModel> extras}) async {
    emit(BasketManagerInitial());
    var box = await Hive.openBox<SelectedItemsModel>(kBasket);
    var item = box.get(itemID);

    if (item != null) {
      _updatedExtraPrice = double.parse(box.get(itemID)!.price) -
          (double.parse(extraPrice) * int.parse(item.quantity!));
      var updatedItem = SelectedItemsModel(
        itemID: item.itemID,
        name: item.name,
        price: _updatedExtraPrice.toString(),
        img: item.img,
        quantity: item.quantity,
        size: item.size,
        extras: extras,
      );

      await box.put(itemID, updatedItem);
      emit(BasketManagerSize(price: updatedItem.price));
      emit(BasketManagerChangeQty(price: updatedItem.price));
    }
  }

  void initialize() {
    emit(BasketManagerInitial());
  }
}
