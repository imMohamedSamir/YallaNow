import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/check_payment_method_cubit/check_payment_method_cubit.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/PayMethodCard.dart';

class DriverPaymentMethodsTile extends StatefulWidget {
  const DriverPaymentMethodsTile({
    Key? key,
  }) : super(key: key);
  @override
  _DriverPaymentMethodsTileState createState() =>
      _DriverPaymentMethodsTileState();
}

class _DriverPaymentMethodsTileState extends State<DriverPaymentMethodsTile> {
  PaymentMethod? selectedValue;
  @override
  void initState() {
    // selectedValue = PaymentMethod.cash;
    if (selectedValue != null) {}
    super.initState();
  }

  void initialPayment() {
    selectedValue = PaymentMethod.cash;
    BlocProvider.of<CheckPaymentMethodCubit>(context)
        .updatePaymentMethod(method: selectedValue!);
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
    return BlocBuilder<CheckPaymentMethodCubit, CheckPaymentMethodState>(
      builder: (context, state) {
        if (state is CheckPaymentMethodChange) {
          if (state.methode == 'cash') {
            selectedValue = PaymentMethod.cash;
          } else if (state.methode == 'Credit Card') {
            selectedValue = PaymentMethod.creditCard;
          } else {
            selectedValue = PaymentMethod.wallet;
          }
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
                method: "Wallet",
                value: PaymentMethod.wallet,
                groupValue: selectedValue,
                onChanged: (value) {
                  _handlePaymentMethodSelected(value);
                },
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
        } else {
          initialPayment();
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
                method: "Wallet",
                value: PaymentMethod.wallet,
                groupValue: selectedValue,
                onChanged: (value) {
                  _handlePaymentMethodSelected(value);
                },
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
      },
    );
  }
}
