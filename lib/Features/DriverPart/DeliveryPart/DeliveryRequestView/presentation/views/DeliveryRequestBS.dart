import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/utlis/functions/getGender.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryRequestView/presentation/views/DeliveryMapSec.dart';
import 'package:yallanow/Features/UserPart/OrdersView/presentation/views/OrderItemCard.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/manager/Functions/launchURL.dart';
import 'package:yallanow/generated/l10n.dart';

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
                  "30.50 ${S.of(context).EGP}",
                  style: AppStyles.styleBold24(context)
                      .copyWith(color: blackdcolor),
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
                SizedBox(
                  width: AppSizes.getWidth(150, context),
                  child: Text(
                    "mohamed ali",
                    style: AppStyles.styleMedium14(context),
                  ),
                ),
                const Spacer(),
                Text(
                  "01127523369",
                  style: AppStyles.styleMedium14(context),
                ),
                const SizedBox(width: 8),
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      launchURL("tel:");
                    },
                    icon: const Icon(Icons.call, size: 20))
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  getGender(gender: "Male"),
                  style: AppStyles.styleMedium14(context),
                ),
                const Gap(8),
                const Icon(Icons.male_outlined, color: Colors.blueAccent)
                // if (requestDetails.gender == "Male" ||
                //     requestDetails.gender == "male")
                //   const Icon(Icons.male_outlined, color: Colors.blueAccent)
                // else
                //   const Icon(Icons.female_outlined,
                //       color: Colors.pinkAccent)
              ],
            ),
            const Divider(),
            Text(S.of(context).OrderDetails,
                style: AppStyles.styleMedium16(context)),
            const SizedBox(height: 8),
            Column(
              children: List.generate(
                  3,
                  (index) => const Padding(
                        padding: EdgeInsets.only(bottom: 6.0),
                        child: OrderItemCard(),
                      )),
            ),
            const Divider(),
            Text(
              S.of(context).PaymentMethod,
              style: AppStyles.styleMedium16(context),
            ),
            const SizedBox(height: 8),
            Text(
              getPaymentMethod(method: "cash"),
              style: AppStyles.styleMedium14(context),
            ),
            const Spacer(),
            CustomButton(
              text: "Accept",
              txtcolor: Colors.white,
              btncolor: pKcolor,
              onPressed: () {
                // NavigateToPage.slideFromRight(
                //     context: context, page: const DeliveryMapSec());
              },
            ),
            const SizedBox(height: 6)
          ],
        ),
      ),
    );
  }
}
