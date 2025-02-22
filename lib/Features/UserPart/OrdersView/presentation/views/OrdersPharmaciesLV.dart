import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Features/UserPart/OrdersView/data/models/OrdersCardModel.dart';
import 'package:yallanow/Features/UserPart/OrdersView/presentation/views/OrderCard.dart';
import 'package:yallanow/Features/UserPart/OrdersView/presentation/views/OrderDetailsPage.dart';

class OrdersPharmaciesLV extends StatelessWidget {
  const OrdersPharmaciesLV({super.key});
  static List<OrdersCardModel> orders = [
    OrdersCardModel(
        title: " Lorem Name",
        img: Assets.imagesPharmacy1,
        price: "20",
        date: "October 17, 2023",
        success: true,
        id: '#0000_124'),
    OrdersCardModel(
        title: " Lorem Name",
        img: Assets.imagesPharmacy2,
        price: "20",
        date: "October 17, 2023",
        success: false,
        id: '#0000_124'),
    OrdersCardModel(
        title: " Lorem Name",
        img: Assets.imagesPharmacy1,
        price: "20",
        date: "October 17, 2023",
        success: true,
        id: '#0000_124'),
    OrdersCardModel(
        title: " Lorem Name",
        img: Assets.imagesPharmacy1,
        price: "20",
        date: "October 17, 2023",
        success: false,
        id: '#0000_124'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final isLastIndex = index == orders.length - 1;
        return Padding(
          padding: EdgeInsets.only(bottom: isLastIndex ? 0 : 16),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 200),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return FadeTransition(
                      opacity: animation,
                      child: OrderDetailsPage(
                        ordersCardModel: orders[index],
                      ),
                    );
                  },
                ),
              );
            },
            child: OrderCard(
              ordersCardModel: orders[index],
            ),
          ),
        );
      },
    );
  }
}
