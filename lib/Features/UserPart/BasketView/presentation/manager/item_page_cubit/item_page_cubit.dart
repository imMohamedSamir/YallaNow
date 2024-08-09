import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/SavePartnerId.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/restrunt_details/extra.dart';
import 'package:yallanow/Features/UserPart/foodView/data/Models/restrunt_details/size.dart';

part 'item_page_state.dart';

class ItemPageCubit extends Cubit<ItemPageState> {
  ItemPageCubit() : super(ItemPageInitial());
  double unitPrice = 0;
  String? partnerId;
  double updatedPrice = 0;
  int? partnerType;
  bool sizeSelected = false;
  SelectedItemsModel? createditem;
  void createItem(
      {required SelectedItemsModel itemsModel, bool isMart = false}) async {
    partnerId = await getPartnerId();
    partnerType = await getPartnerType();
    createditem = SelectedItemsModel(
        itemID: itemsModel.itemID,
        partnerID: partnerId,
        partnerType: partnerType,
        name: itemsModel.name,
        price: itemsModel.price,
        img: itemsModel.img,
        quantity: "1",
        size: itemsModel.size,
        extras: itemsModel.extras);
    unitPrice = double.parse(createditem!.price);
  }

  Future<bool> _checkPartnerType() async {
    var box = await Hive.openBox<SelectedItemsModel>(kBasket);
    if (box.isEmpty) {
      return true;
    } else {
      String firstPartnerId = box.values.first.partnerID ?? "";
      if (createditem!.partnerID != firstPartnerId) {
        return false; // Different partnerId found
      }
      // for (var item in box.values) {

      // }
    }

    return true; // All items have the same partnerId
  }

  void addToBasket({required String itemID}) async {
    var box = await Hive.openBox<SelectedItemsModel>(kBasket);

    bool checkPartner = await _checkPartnerType();

    if (checkPartner) {
      if (createditem != null) {
        emit(ItemPageInitial());
        await box.put(createditem!.itemID, createditem!);
        emit(ItemPageAdded());
      }
    } else {
      emit(ItemPageInitial());
      await box.put(createditem!.itemID, createditem!);
      emit(ItemPageChange(
          updatedPrice: updatedPrice.toString(), isOtherPartner: true));
    }
  }

  void clearOrAdd({required bool clear, String? itemID}) async {
    var box = await Hive.openBox<SelectedItemsModel>(kBasket);
    if (clear) {
      box.clear();

      if (itemID != null) {
        var item = box.get(itemID);
        if (item != null) {
          partnerId = item.partnerID;
        }
        addToBasket(itemID: itemID);
      }
    } else {
      emit(ItemPageChange(updatedPrice: updatedPrice.toString()));
    }
  }

  void chooseSize(
      {required String itemID,
      required String sizePrice,
      required ItemSize selectedSize}) async {
    emit(ItemPageInitial());
    sizeSelected = true;
    var box = await Hive.openBox<SelectedItemsModel>(kBasket);
    // var item = box.get(itemID);
    double priceWithOutExtra = 0;
    double newsizePrice = 0;
    if (createditem != null) {
      priceWithOutExtra = unitPrice * int.parse(createditem!.quantity!);
      double currentItemPrice = double.parse(createditem!.price);
      currentItemPrice = currentItemPrice - priceWithOutExtra;
      unitPrice = double.parse(sizePrice);
      newsizePrice = unitPrice * int.parse(createditem!.quantity!);
      currentItemPrice += newsizePrice;
      updatedPrice = currentItemPrice;

      var updatedItem = SelectedItemsModel(
        itemID: createditem!.itemID,
        partnerID: partnerId,
        partnerType: partnerType,
        name: createditem!.name,
        price:
            currentItemPrice.toString(), // Update the price based on quantity
        img: createditem!.img,
        quantity: createditem!.quantity,
        size: selectedSize,
        extras: createditem!.extras,
      );
      createditem = updatedItem;
      await box.put(itemID, createditem!);

      emit(ItemPageChange(
          updatedPrice: currentItemPrice.toString(),
          selectedSize: sizeSelected));
    }
  }

  void changeQty(
      {required String itemID, required int number, bool add = true}) async {
    emit(ItemPageInitial());

    var box = await Hive.openBox<SelectedItemsModel>(kBasket);
    if (createditem != null) {
      double currentItemPrice = double.parse(createditem!.price);
      if (add) {
        updatedPrice = currentItemPrice + unitPrice;
      } else {
        updatedPrice = currentItemPrice - unitPrice;
      }
      var updatedItem = SelectedItemsModel(
        itemID: createditem!.itemID,
        partnerID: partnerId,
        partnerType: partnerType,

        name: createditem!.name,
        price: updatedPrice.toString(), // Update the price based on quantity
        img: createditem!.img,
        quantity: number.toString(),
        size: createditem!.size,
        extras: createditem!.extras,
      );
      createditem = updatedItem;
      await box.put(itemID, createditem!);

      emit(ItemPageChange(
          updatedPrice: updatedItem.price, selectedSize: sizeSelected));
    }
  }

  void chooseExtra({
    required String itemID,
    required int quantity,
    required Extra itemExtra,
    bool addExtra = true,
  }) async {
    var box = await Hive.openBox<SelectedItemsModel>(kBasket);
    if (createditem != null) {
      emit(ItemPageInitial());
      double extraUnitPrice = itemExtra.price!.toDouble();
      double currentItemPrice = double.parse(createditem!.price);
      itemExtra.quantity = quantity;
      List<Extra> updatedExtras = List.from(createditem!.extras ?? []);
      if (addExtra) {
        updatedExtras.add(itemExtra);
        updatedPrice = currentItemPrice + extraUnitPrice;
      } else {
        updatedExtras.remove(itemExtra);
        updatedPrice = currentItemPrice - extraUnitPrice;
      }

      var updatedItem = SelectedItemsModel(
        itemID: createditem!.itemID,
        partnerID: partnerId,
        partnerType: partnerType,
        name: createditem!.name,
        price: updatedPrice.toString(),
        img: createditem!.img,
        quantity: createditem!.quantity,
        size: createditem!.size,
        extras: updatedExtras,
      );
      createditem = updatedItem;
      await box.put(itemID, createditem!);
      emit(ItemPageChange(
          updatedPrice: updatedPrice.toString(), selectedSize: sizeSelected));
    }
  }
}
