import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/ContactInfoCard.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryOrdersView/presentation/views/DeliveryOrderDetailsPage.dart';
import 'package:yallanow/Features/UserPart/OrdersView/presentation/views/OrderCardHeader.dart';
import 'package:yallanow/generated/l10n.dart';

class DeliveryOrderCard extends StatelessWidget {
  const DeliveryOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigateToPage.slideFromRightAndFade(
            context: context, page: const DeliveryOrderDetailsPage());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const OrderCardHeader(date: "October 17, 2023", isSuccess: true),
            const SizedBox(height: 16),
            ContactInfoCard(
              isordered: true,
              height: AppSizes.getHeight(110, context),
              title:
                  "Tagamomo 5 EGP Lorem ipsum dolor sit amet ces tincidunt eleifend vitae",
              image: SvgPicture.asset(
                Assets.imagesLocationMark,
                height: AppSizes.getHeight(20, context),
                width: AppSizes.getWidth(20, context),
              ),
            ),
            // const Divider(height: 32),
            Text(S.of(context).ViewDetails,
                style: AppStyles.styleMedium16(context)
                    .copyWith(color: const Color(0xff5A5A5A))),
          ],
        ),
      ),
    );
  }
}
