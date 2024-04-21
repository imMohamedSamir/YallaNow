import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/check_payment_method_cubit/check_payment_method_cubit.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/showOrderPlaced.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/PaymentWebView.dart';
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
        } else if (state is CheckPaymentMethodCreditMethod) {
          return CustomButton(
              text: "Yalla",
              txtcolor: Colors.white,
              btncolor: const Color(0xffB20404),
              onPressed: () async {
                String paymentKey =
                    await BlocProvider.of<CheckPaymentMethodCubit>(context)
                        .goToPaymentPage(amount: 100);

                if (!context.mounted) return;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PaymentWebView(paymentKey: paymentKey),
                  ),
                );
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
