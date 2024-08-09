import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/ContactInfoCard.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/OrdersView/data/models/OrdersCardModel.dart';
import 'package:yallanow/Features/UserPart/OrdersView/presentation/views/OrderCard.dart';
import 'package:yallanow/Features/UserPart/OrdersView/presentation/views/OrderSummary.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key, required this.ordersCardModel});
  final OrdersCardModel ordersCardModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondAppBar(context, title: "Order details"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(children: [
            OrderDetailsCard(ordersCardModel: ordersCardModel),
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
              title: "01112345678",
              image: Image.asset(
                Assets.imagesPhoneIcon,
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
            const Divider(color: Color(0xff9E9D9D)),
            const SizedBox(height: 8),
            // const OrderSummary(),
            const SizedBox(height: 12),
          ]),
        ),
      ),
    );
  }
}
