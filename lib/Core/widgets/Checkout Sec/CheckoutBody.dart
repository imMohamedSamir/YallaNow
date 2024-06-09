import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/functions/DialogMethode.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/CheckoutButtonBuilder.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/ContactInfoSec.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/place_order_cubit/place_order_cubit.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/NotesSec.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/PayMethodsSec.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/views/OrderDetails.dart';

class CheckoutBody extends StatelessWidget {
  const CheckoutBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var key = BlocProvider.of<PlaceOrderCubit>(context).formKey;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: key,
          child: BlocListener<PlaceOrderCubit, PlaceOrderState>(
            listener: (context, state) {
              if (state is PlaceOrderFailure) {
                checkoutDialog(context, msg: state.errMsg);
              }
            },
            child: const Column(
              children: [
                SizedBox(height: 24),
                ContactInfoSec(),
                SizedBox(height: 16),
                PayMethodsSec(),
                SizedBox(height: 24),
                NotesSec(),
                SizedBox(height: 24),
                OrderDetails(),
                SizedBox(height: 24),
                CheckoutButtonBuilder(),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
