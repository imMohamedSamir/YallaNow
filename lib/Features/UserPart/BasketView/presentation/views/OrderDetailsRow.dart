import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class OrderDetailsRow extends StatelessWidget {
  const OrderDetailsRow({
    super.key,
    required this.type,
    required this.price,
    required this.total,
  });
  final String type, price;
  final bool total;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          type,
          style: total
              ? AppStyles.styleMedium14(context)
                  .copyWith(color: const Color(0xff5A5A5A))
              : AppStyles.styleRegular14(context)
                  .copyWith(color: const Color(0xff5A5A5A)),
        ),
        const Spacer(),
        Text(
          price,
          style: total
              ? AppStyles.styleMedium14(context)
                  .copyWith(color: const Color(0xff5A5A5A))
              : AppStyles.styleRegular14(context)
                  .copyWith(color: const Color(0xff5A5A5A)),
        ),
      ],
    );
  }
}
