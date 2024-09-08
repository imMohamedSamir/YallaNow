import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/SavePartnerId.dart';
import 'package:yallanow/Core/utlis/functions/getTotalPrice.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/data/Models/place_order_model.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/data/Repo/CheckoutRepo.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/basket_item_model/BasketItemExtra.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/basket_item_model/BasketItemSize.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/basket_item_model/basket_item_model.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/models/selectedItemsModel.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';

part 'place_order_state.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  PlaceOrderCubit(this.checkOutRepo) : super(PlaceOrderInitial());
  final CheckOutRepo checkOutRepo;
  final formKey = GlobalKey<FormState>();
  PlaceOrderModel checkoutdetails = PlaceOrderModel();
  void fetch(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      emit(PlaceOrderLoading());
      await parseItems(context);
      log(checkoutdetails.toJson().toString());
      emit(PlaceOrderSuccess(response: "r"));
      // var results =
      //     await checkOutRepo.fetchPlaceOrder(orderDetails: checkoutdetails);
      // results.fold((faile) {
      //   log(faile.errMessage);
      //   emit(PlaceOrderFailure(errMsg: faile.errMessage));
      // }, (r) => emit(PlaceOrderSuccess(response: r)));
    } else {
      emit(const PlaceOrderFailure(errMsg: 'Please fill all the fields'));
    }
  }

  Future<void> parseItems(BuildContext context) async {
    List<SelectedItemsModel> selectedItems =
        Hive.box<SelectedItemsModel>(kBasket).values.toList();
    List<BasketItemModel> basketItems = [];
    var basketcubit = BlocProvider.of<BasketManagerCubit>(context);
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
    checkoutdetails.partnerId = await getPartnerId();
    checkoutdetails.partnerType = await getPartnerType();
    checkoutdetails.items = basketItems;
    checkoutdetails.itemNotes = basketcubit.orederNotes;
    checkoutdetails.subTotalAmount = getSubTotalPrice();
  }
}
