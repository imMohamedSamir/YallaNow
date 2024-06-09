import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryRequestView/presentation/views/DeliveryMapSec.dart';

class DeliveryRequestBS extends StatelessWidget {
  const DeliveryRequestBS({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "30.50 EGP",
                  style: AppStyles.styleBold24(context)
                      .copyWith(color: thirdcolor),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.cancel, size: 28, color: pKcolor))
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "Elazaby",
              style: AppStyles.styleMedium18(context),
            ),
            const SizedBox(height: 8),
            Text(
              "Hurgada - AlKawser",
              style: AppStyles.styleMedium14(context),
            ),
            const Divider(),
            Row(
              children: [
                Text(
                  "mohamed ali",
                  style: AppStyles.styleMedium14(context),
                ),
                const Spacer(),
                Text(
                  "01127523369",
                  style: AppStyles.styleMedium14(context),
                ),
                const SizedBox(width: 8),
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(Icons.call, size: 20))
              ],
            ),
            const Divider(),
            Text(
              "Order Details",
              style: AppStyles.styleMedium16(context),
            ),
            const SizedBox(height: 8),
            Text(
              "panadol -signal- Axe",
              style: AppStyles.styleMedium14(context),
            ),
            const Divider(),
            Text(
              "Payment Method",
              style: AppStyles.styleMedium16(context),
            ),
            const SizedBox(height: 8),
            Text(
              "cash",
              style: AppStyles.styleMedium14(context),
            ),
            const Spacer(),
            CustomButton(
              text: "Accept",
              txtcolor: Colors.white,
              btncolor: pKcolor,
              onPressed: () {
                NavigateToPage.slideFromRight(
                    context: context, page: const DeliveryMapSec());
              },
            ),
            const SizedBox(height: 6)
          ],
        ),
      ),
    );
  }
}
