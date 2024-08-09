import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/CheckoutBody.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/check_payment_method_cubit/check_payment_method_cubit.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/place_order_cubit/place_order_cubit.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/data/Repo/CheckOutRepoImpl.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/generated/l10n.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CheckPaymentMethodCubit(),
        ),
        BlocProvider(
          create: (context) => PlaceOrderCubit(getIt.get<CheckoutRepoImpl>()),
        ),
      ],
      child: Scaffold(
        appBar: secondAppBar(context, title: S.of(context).Checkout),
        body: const CheckoutBody(),
      ),
    );
  }
}
