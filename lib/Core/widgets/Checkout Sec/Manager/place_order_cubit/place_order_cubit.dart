import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/functions/SavePartnerId.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/data/Models/place_order_model.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/data/Repo/CheckoutRepo.dart';

part 'place_order_state.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  PlaceOrderCubit(this.checkOutRepo) : super(PlaceOrderInitial());
  final CheckOutRepo checkOutRepo;
  final formKey = GlobalKey<FormState>();
  PlaceOrderModel checkoutdetails = PlaceOrderModel();
  void fetch() async {
    checkoutdetails.partnerId = await getPartnerId();
    checkoutdetails.partnerType = await getPartnerType();
    var results =
        await checkOutRepo.fetchPlaceOrder(orderDetails: checkoutdetails);
    results.fold((faile) {
      log(faile.errMessage);
      emit(PlaceOrderFailure(errMsg: faile.errMessage));
    }, (r) => emit(PlaceOrderSuccess(response: r)));
  }
}
