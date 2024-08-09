import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/functions/DialogMethode.dart';

class PharmacyItemAppBar extends StatelessWidget {
  const PharmacyItemAppBar({super.key, required this.imgUrl});
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    String url = imgUrl.replaceAll('\\', '/');
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
                child: CachedNetworkImage(
              imageUrl: url,
              height: AppSizes.getHeight(180, context),
              width: AppSizes.getWidth(180, context),
              fit: BoxFit.fill,
            ))
          ],
        ));
  }
}
