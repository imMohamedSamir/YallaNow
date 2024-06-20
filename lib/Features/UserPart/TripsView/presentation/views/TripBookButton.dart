import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripBookPage.dart';
import 'package:yallanow/generated/l10n.dart';

class TripBookButton extends StatelessWidget {
  const TripBookButton({super.key, required this.tripId});
  final String tripId;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
      height: AppSizes.getHeight(90, context),
      child: CustomButton(
        text: S.of(context).Book,
        btncolor: pKcolor,
        txtcolor: Colors.white,
        onPressed: () {
          NavigateToPage.slideFromBottom(
              context: context, page: TripBookPage(tripId: tripId));
        },
      ),
    );
  }
}
