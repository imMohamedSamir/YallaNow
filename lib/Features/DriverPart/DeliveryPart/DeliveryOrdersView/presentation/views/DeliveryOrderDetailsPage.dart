import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/ContactInfoCard.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/OrdersView/presentation/views/OrderCardHeader.dart';
import 'package:yallanow/Features/UserPart/OrdersView/presentation/views/OrderSummary.dart';
import 'package:yallanow/generated/l10n.dart';

class DeliveryOrderDetailsPage extends StatelessWidget {
  const DeliveryOrderDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondAppBar(context, title: S.of(context).OrderDetails),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(children: [
            const OrderCardHeader(date: "October 17, 2023", isSuccess: true),
            const SizedBox(height: 16),
            ContactInfoCard(
              isordered: true,
              height: AppSizes.getHeight(101, context),
              title: "Tagamomo 5",
              subtitle:
                  "EGP Lorem ipsum dolor sit amet ces tincidunt eleifend vitae",
              image: SvgPicture.asset(
                Assets.imagesLocationMark,
                height: AppSizes.getHeight(20, context),
                width: AppSizes.getWidth(20, context),
              ),
            ),
            const SizedBox(height: 16),
            ContactInfoCard(
                isordered: true,
                height: AppSizes.getHeight(55, context),
                title: "Cash",
                image: SvgPicture.asset(
                  Assets.imagesCashICon,
                  height: AppSizes.getHeight(20, context),
                  width: AppSizes.getWidth(20, context),
                )),
            const SizedBox(height: 8),
            const Divider(height: 16),
            const SizedBox(height: 8),
            const OrderSummary(),
            const SizedBox(height: 12),
          ]),
        ),
      ),
    );
  }
}
