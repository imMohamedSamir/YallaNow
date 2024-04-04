import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class DeliveryDetails extends StatelessWidget {
  const DeliveryDetails({super.key, required this.pageController});
  final PageController pageController;
  static List<DeliveryDetailsModel> Details = [
    DeliveryDetailsModel(
        title: " Order placed",
        dsc: "Your order placed successfully. Thanks for your order."),
    DeliveryDetailsModel(
        title: " Order preparing",
        dsc: "Your order placed successfully. Thanks for your order."),
    DeliveryDetailsModel(
        title: " Order picked up",
        dsc: "Your order placed successfully. Thanks for your order."),
    DeliveryDetailsModel(
        title: " Order delivered",
        dsc: "Your order placed successfully. Thanks for your order.")
  ];
  @override
  Widget build(BuildContext context) {
    return ExpandablePageView(
        controller: pageController,
        children: List.generate(
          4,
          (index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Details[index].title,
                  style: AppStyles.styleSemiBold20(context)
                      .copyWith(fontSize: 24)),
              const SizedBox(height: 12),
              Text(Details[index].dsc,
                  style: AppStyles.styleMedium16(context)
                      .copyWith(color: const Color(0xff5A5A5A)),
                  maxLines: 2),
            ],
          ),
        ));
  }
}

class DeliveryDetailsModel {
  final String title, dsc;

  DeliveryDetailsModel({required this.title, required this.dsc});
}
