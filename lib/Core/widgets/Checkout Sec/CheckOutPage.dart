import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/CheckoutBody.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/check_payment_method_cubit/check_payment_method_cubit.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignUpAppBar.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckPaymentMethodCubit(),
      child: Scaffold(
        appBar: basketCustomAppBar(context, title: "Checkout", onPressed: () {
          Navigator.pop(context);
        }),
        body: const CheckoutBody(),
      ),
    );
  }
}
