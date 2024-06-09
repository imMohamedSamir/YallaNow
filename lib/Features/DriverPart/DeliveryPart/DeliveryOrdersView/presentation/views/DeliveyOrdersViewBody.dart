import 'package:flutter/material.dart';
import 'package:yallanow/Features/DriverPart/DeliveryPart/DeliveryOrdersView/presentation/views/DeliveryOrderCard.dart';

class DeliveryOrdersView extends StatelessWidget {
  const DeliveryOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: DeliveryOrderCard(),
        );
      },
    );
  }
}
