import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/scooter_rating_cubit/scooter_rating_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/MainHomeView.dart';
import 'package:yallanow/generated/l10n.dart';

class ScooterRatingBody extends StatelessWidget {
  const ScooterRatingBody({super.key});

  @override
  Widget build(BuildContext context) {
    var ratingCubit = BlocProvider.of<ScooterRatingCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 64),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  NavigateToPage.slideFromTop(
                      context: context, page: const MainHomeView());
                },
                icon: const Icon(Icons.close)),
            const Gap(60),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  // Text(S.of(context).RatingDriverQ,
                  //     style: AppStyles.styleSemiBold20(context)),
                  // const Gap(16),
                  // RatingBar.builder(
                  //   itemBuilder: (context, index) {
                  //     return const Icon(Icons.star_rate_rounded,
                  //         color: Color(0xffFEC400));
                  //   },
                  //   onRatingUpdate: (value) {
                  //     log(value.toString());
                  //     ratingCubit.rating.driverRate = value.round();
                  //   },
                  // ),
                  // const Gap(24),
                  Text(S.of(context).RatingTripQ,
                      style: AppStyles.styleSemiBold20(context)),
                  const Gap(16),
                  RatingBar.builder(
                    itemBuilder: (context, index) {
                      return const Icon(Icons.star_rate_rounded,
                          color: Color(0xffFEC400));
                    },
                    onRatingUpdate: (value) {
                      log(value.toString());
                      ratingCubit.rating.tripRate = value.round();
                    },
                  ),
                ],
              ),
            ),
            const Gap(24),
            CustomTextField(
              hintText: S.of(context).comment,
              onChanged: (value) {
                ratingCubit.rating.note = value;
              },
            ),
            const Gap(24),
            CustomButton(
              text: S.of(context).Yalla,
              txtcolor: Colors.white,
              btncolor: pKcolor,
              onPressed: () {
                ratingCubit.send(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
