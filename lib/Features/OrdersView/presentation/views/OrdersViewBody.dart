import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/OrdersView/presentation/views/OrdersFoodLV.dart';
import 'package:yallanow/Features/OrdersView/presentation/views/OrdersMartsLV.dart';
import 'package:yallanow/Features/OrdersView/presentation/views/OrdersPharmaciesLV.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: favoriteAppBar(context, isOrder: true, title: 'Orders'),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 26),
          child: TabBarView(
            children: <Widget>[
              OrdersFoodLV(),
              OrdersMartsLV(),
              OrdersPharmaciesLV()
            ],
          ),
        ),
      ),
    );
  }
}
