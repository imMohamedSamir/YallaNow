import 'package:flutter/material.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinOrdersView/presentation/views/CaptinOrderCard.dart';

class CaptinOrdersViewBody extends StatelessWidget {
  const CaptinOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: CaptinOrderCard(),
        );
      },
    );
  }
}
