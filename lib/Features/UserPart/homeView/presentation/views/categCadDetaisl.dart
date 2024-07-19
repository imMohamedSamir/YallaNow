import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppLang.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/ScooterRideView.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/TripsVew.dart';
import 'package:yallanow/Features/UserPart/homeView/data/Models/CardDetailModel.dart';

class CategCardDetails extends StatelessWidget {
  const CategCardDetails({
    super.key,
    required this.cardDetails,
    required this.index,
  });

  final CardCategDetails cardDetails;
  final int index;
  @override
  Widget build(BuildContext context) {
    bool checkTitle(String title) {
      return title.split(" ").length >= 2;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        if (!cardDetails.isComingSoon!) {
          if (index == 0) {
            NavigateToPage.slideFromRight(
                context: context, page: const ScooterRideView(fromHome: true));
          } else if (index == 1) {
            NavigateToPage.slideFromRight(
                context: context, page: const TripsView());
          }
        }
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: grayColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                !checkTitle(cardDetails.title)
                    ? FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          cardDetails.title,
                          style: AppStyles.styleSemiBold16(context),
                          textAlign: AppLang.isArabic() ? TextAlign.left : null,
                        ),
                      )
                    : Text(
                        cardDetails.title,
                        style: AppStyles.styleSemiBold16(context),
                        textAlign: AppLang.isArabic() ? TextAlign.left : null,
                      ),
                // const Spacer(),
                Flexible(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      cardDetails.img,
                      alignment: Alignment.bottomRight,
                      height: AppSizes.getHeight(63, context),
                      width: AppSizes.getWidth(65, context),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (cardDetails.isComingSoon!)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    'Coming Soon',
                    style: AppStyles.styleSemiBold14(context).copyWith(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
