import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripBookForm.dart';
import 'package:yallanow/generated/l10n.dart';

class TripBookPageBody extends StatelessWidget {
  const TripBookPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).RegistrationForm,
                style: AppStyles.styleMedium24(context)
                    .copyWith(color: blackdcolor)),
            const Gap(5),
            Text(S.of(context).RegistrationDsc,
                style:
                    AppStyles.styleRegular16(context).copyWith(color: scColor)),
            const Gap(24),
            const TripBookForm()
          ],
        ),
      ),
    );
  }
}
