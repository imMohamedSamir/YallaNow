import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/functions/DialogMethode.dart';

class MarketItemAppBar extends StatelessWidget {
  const MarketItemAppBar({super.key, required this.img});
  final String img;
  @override
  Widget build(BuildContext context) {
    String url = img.replaceAll('\\', '/');
    return Container(
        padding: const EdgeInsets.only(top: 55, left: 16, bottom: 8),
        width: double.infinity,
        height: AppSizes.getHeight(200, context),
        child: Stack(
          children: [
            Container(
                width: AppSizes.getWidth(32, context),
                height: AppSizes.getHeight(32, context),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                    onTap: () {
                      dialogMethode(context);
                    },
                    child: const Center(child: Icon(Icons.close)))),
            Center(
              child: Image.network(
                url,
                height: AppSizes.getHeight(150, context),
                width: AppSizes.getWidth(150, context),
              ),
            )
          ],
        ));
  }
}
