import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/check_payment_method_cubit/check_payment_method_cubit.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/PayMethodCard.dart';

class PaymentMethodsTile extends StatefulWidget {
  const PaymentMethodsTile({
    Key? key,
  }) : super(key: key);
  @override
  State<PaymentMethodsTile> createState() => _PaymentMethodsTileState();
}

class _PaymentMethodsTileState extends State<PaymentMethodsTile> {
  PaymentMethod? selectedValue;
  @override
  void initState() {
    selectedValue = PaymentMethod.cash;
    BlocProvider.of<CheckPaymentMethodCubit>(context)
        .updatePaymentMethod(method: selectedValue!);
    super.initState();
  }

  void _handlePaymentMethodSelected(PaymentMethod value) {
    setState(() {
      selectedValue = value;
      BlocProvider.of<CheckPaymentMethodCubit>(context)
          .updatePaymentMethod(method: value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PayMethodCard(
          method: "Cash",
          value: PaymentMethod.cash,
          groupValue: selectedValue,
          onChanged: (value) => _handlePaymentMethodSelected(value),
          img: SvgPicture.asset(
            Assets.imagesCashICon,
            height: 20,
            width: 20,
          ),
        ),
        const SizedBox(height: 16),
        PayMethodCard(
          method: "Credit card",
          value: PaymentMethod.creditCard,
          groupValue: selectedValue,
          onChanged: (value) => _handlePaymentMethodSelected(value),
          img: Image.asset(
            Assets.imagesCreditcardIcon,
            height: AppSizes.getHeight(20, context),
            width: AppSizes.getWidth(20, context),
          ),
        ),
      ],
    );
  }
}
