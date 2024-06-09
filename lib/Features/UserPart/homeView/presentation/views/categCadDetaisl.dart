import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/CardDetailModel.dart';

class CategCardDetails extends StatelessWidget {
  const CategCardDetails({super.key, required this.cardDetails});
  final CardCategDetails cardDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppSizes.getHeight(100, context),
        width: MediaQuery.sizeOf(context).width / 3 - 25,
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xffF5F5F5),
        ),
        child: Stack(
          children: [
            Positioned(
                top: 8,
                left: 8,
                child: cardDetails.title == "Mart & Groceries"
                    ? RichText(
                        text: TextSpan(children: const [
                        TextSpan(text: "Mart & \n"),
                        TextSpan(text: "Groceries"),
                      ], style: AppStyles.styleSemiBold16(context)))
                    : Text(cardDetails.title,
                        style: AppStyles.styleSemiBold16(context))),
            Positioned(
              top: cardDetails.title == "Mart & Groceries" ? 50 : 40,
              left: 28,
              child: Image.asset(
                cardDetails.img,
                height: AppSizes.getHeight(54, context),
                width: AppSizes.getWidth(65, context),
                fit: BoxFit.contain,
              ),
            ),
          ],
        ));
  }
}
