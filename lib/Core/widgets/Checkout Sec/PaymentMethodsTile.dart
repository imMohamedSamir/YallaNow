import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/PayMethodCard.dart';

enum PayMethodEnum { cash, credit }

class PaymentMethodsTile extends StatefulWidget {
  const PaymentMethodsTile({super.key});

  @override
  State<PaymentMethodsTile> createState() => _PaymentMethodsTileState();
}

class _PaymentMethodsTileState extends State<PaymentMethodsTile> {
  PayMethodEnum? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PayMethodCard(
          method: "Cash",
          value: PayMethodEnum.cash,
          groupValue: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
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
          value: PayMethodEnum.credit,
          groupValue: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
          },
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
