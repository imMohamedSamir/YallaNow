import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinOrdersView/presentation/views/CaptinOrderDetailsPage.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinOrdersView/presentation/views/CaptinSrcDstSec.dart';
import 'package:yallanow/Features/UserPart/OrdersView/presentation/views/OrderCardHeader.dart';

class CaptinOrderCard extends StatelessWidget {
  const CaptinOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigateToPage.slideFromRight(
            context: context, page: const CaptinOrderDetailsPage());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const OrderCardHeader(date: "October 17, 2023", isSuccess: true),
            const SizedBox(height: 16),
            const CaptinSrcDstSec(),
            const Divider(height: 32),
            Text("View details",
                style: AppStyles.styleMedium16(context)
                    .copyWith(color: const Color(0xff5A5A5A))),
          ],
        ),
      ),
    );
  }
}
