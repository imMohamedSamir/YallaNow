import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/OrdersView/presentation/views/ReoderButton.dart';

class OrderCardHeader extends StatelessWidget {
  const OrderCardHeader(
      {super.key,
      required this.date,
      required this.isSuccess,
      this.isOrderDetail = false});
  final String date;
  final bool isSuccess, isOrderDetail;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: AppSizes.getHeight(16, context),
            width: AppSizes.getWidth(16, context),
            decoration: BoxDecoration(
                color: isSuccess
                    ? const Color(0xff4AAF57)
                    : const Color(0xffB20404),
                shape: BoxShape.circle)),
        const SizedBox(width: 10),
        Text(
          date,
          style: AppStyles.styleRegular14(context)
              .copyWith(color: const Color(0xff240301)),
        ),
        const Spacer(),
        isOrderDetail ? const ReoderButton() : const SizedBox(),
      ],
    );
  }
}
