import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/utlis/functions/getTotalPrice.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/check_payment_method_cubit/check_payment_method_cubit.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/place_order_cubit/place_order_cubit.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/showOrderPlaced.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/PaymentWebView.dart';
import 'package:yallanow/Core/widgets/customButton.dart';

class CheckoutButtonBuilder extends StatelessWidget {
  const CheckoutButtonBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var placOrderCubit = BlocProvider.of<PlaceOrderCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: BlocConsumer<CheckPaymentMethodCubit, CheckPaymentMethodState>(
        builder: (context, state) {
          placOrderCubit.checkoutdetails.paymentMethod = 0;

          if (state is CheckPaymentMethodLoading) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 165.0, vertical: 16),
              child: CircularProgressIndicator(color: pKcolor),
            );
          } else if (state is CheckPaymentMethodChange) {
            return BlocBuilder<PlaceOrderCubit, PlaceOrderState>(
              builder: (context, placeOrderState) {
                if (placeOrderState is PlaceOrderLoading) {
                  return const CircularProgressIndicator(color: pKcolor);
                } else {
                  return CustomButton(
                    text: "Yalla",
                    txtcolor: Colors.white,
                    btncolor: pKcolor,
                    onPressed: () async {
                      if (state.methode == PaymentMethod.creditCard) {
                        placOrderCubit.checkoutdetails.paymentMethod = 2;
                        BlocProvider.of<CheckPaymentMethodCubit>(context)
                            .goToPaymentPage(context,
                                amount: getSubTotalPrice() + 15);
                      } else if (state.methode == PaymentMethod.wallet) {
                        placOrderCubit.checkoutdetails.paymentMethod = 1;

                        placOrderCubit.fetch(context);
                      } else {
                        placOrderCubit.checkoutdetails.paymentMethod = 0;

                        placOrderCubit.fetch(context);
                      }
                    },
                  );
                }
              },
            );
          } else {
            return CustomButton(
              text: "Yalla",
              txtcolor: Colors.white,
              btncolor: pKcolor,
              onPressed: () {
                showOrderPlaced(context);
                BlocProvider.of<PlaceOrderCubit>(context).fetch(context);
              },
            );
          }
        },
        listener: (BuildContext context, CheckPaymentMethodState state) {
          if (state is CheckPaymentMethodChange &&
              state.isCredit &&
              state.paymentKey != null) {
            NavigateToPage.slideFromRight(
                context: context,
                page: PaymentWebView(paymentKey: state.paymentKey!));
          }
        },
      ),
    );
  }
}
