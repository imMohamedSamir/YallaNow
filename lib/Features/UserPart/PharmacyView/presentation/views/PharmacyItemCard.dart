import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/models/pharmacy_details_model/PharmacyItem.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyAddIcon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FoodResturantSecondAppBar.dart';

class PharmacyItemCard extends StatelessWidget {
  const PharmacyItemCard({
    super.key,
    required this.item,
  });
  final PharmacyItem item;
  @override
  Widget build(BuildContext context) {
    String url = item.imageUrl!.replaceAll('\\', '/');

    return Expanded(
      child: Container(
        width: AppSizes.getWidth(148, context),
        decoration: BoxDecoration(
            color: const Color(0xffF5F5F5),
            borderRadius: BorderRadius.circular(16)),
        child: Stack(
          children: [
            // Positioned(left: 0, top: 0, child: SalesMark(width: width)),
            Positioned(
              top: 0,
              left: 14,
              right: 14,
              child: AspectRatio(
                aspectRatio: 1.1,
                child: CachedNetworkImage(
                  imageUrl: url,
                  placeholder: (context, url) => const LoadingImg(),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: pKcolor),
                ),
              ),
            ),
            Positioned(right: 7, bottom: 7, child: PharmacyAddIcon(item: item))
          ],
        ),
      ),
    );
  }
}
