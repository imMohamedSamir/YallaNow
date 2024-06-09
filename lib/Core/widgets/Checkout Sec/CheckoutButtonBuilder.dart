import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/DialogMethode.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/check_payment_method_cubit/check_payment_method_cubit.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/place_order_cubit/place_order_cubit.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/showOrderPlaced.dart';
import 'package:yallanow/Core/widgets/customButton.dart';

class CheckoutButtonBuilder extends StatelessWidget {
  const CheckoutButtonBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckPaymentMethodCubit, CheckPaymentMethodState>(
      builder: (context, state) {
        if (state is CheckPaymentMethodLoading) {
          return const Center(child: CircularProgressIndicator(color: pKcolor));
        } else if (state is CheckPaymentMethodChange) {
          return CustomButton(
              text: "Yalla",
              txtcolor: Colors.white,
              btncolor: const Color(0xffB20404),
              onPressed: () async {
                if (state.methode == 'creditCard') {
                  BlocProvider.of<CheckPaymentMethodCubit>(context)
                      .goToPaymentPage(context, amount: 100);
                } else if (state.methode == 'wallet') {
                  var key = BlocProvider.of<PlaceOrderCubit>(context).formKey;
                  if (key.currentState!.validate()) {
                    key.currentState!.save();
                    BlocProvider.of<PlaceOrderCubit>(context).fetch();
                  }
                }
              });
        } else {
          return CustomButton(
            text: "Yalla",
            txtcolor: Colors.white,
            btncolor: const Color(0xffB20404),
            onPressed: () {
              showOrderPlaced(context);
            },
          );
        }
      },
    );
  }
}
