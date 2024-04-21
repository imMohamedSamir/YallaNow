import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/OrdersView/data/models/OrdersCardModel.dart';
import 'package:yallanow/Features/UserPart/OrdersView/presentation/views/OrderCardBody.dart';
import 'package:yallanow/Features/UserPart/OrdersView/presentation/views/OrderCardHeader.dart';
import 'package:yallanow/Features/UserPart/OrdersView/presentation/views/OrderDetailsPage.dart';
import 'package:yallanow/Features/UserPart/OrdersView/presentation/views/ReoderButton.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.ordersCardModel});
  final OrdersCardModel ordersCardModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      color: Colors.white,
      child: Column(
        children: [
          OrderCardHeader(
            date: ordersCardModel.date,
            isSuccess: ordersCardModel.success,
          ),
          OrderCardBody(
            title: ordersCardModel.title,
            price: ordersCardModel.price,
            id: ordersCardModel.id,
            img: ordersCardModel.img,
          ),
          const Divider(color: Color(0xff9E9D9D)),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 200),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return FadeTransition(
                          opacity: animation,
                          child: OrderDetailsPage(
                            ordersCardModel: ordersCardModel,
                          ),
                        );
                      },
                    ),
                  );
                },
                child: Text("View details",
                    style: AppStyles.styleMedium16(context)
                        .copyWith(color: const Color(0xff5A5A5A))),
              ),
              const Spacer(),
              const ReoderButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({super.key, required this.ordersCardModel});
  final OrdersCardModel ordersCardModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
      color: Colors.white,
      child: Column(
        children: [
          OrderCardHeader(
            date: ordersCardModel.date,
            isSuccess: ordersCardModel.success,
            isOrderDetail: true,
          ),
          OrderCardBody(
            title: ordersCardModel.title,
            price: ordersCardModel.price,
            id: ordersCardModel.id,
            img: ordersCardModel.img,
          ),
          const Divider(color: Color(0xff9E9D9D)),
        ],
      ),
    );
  }
}
