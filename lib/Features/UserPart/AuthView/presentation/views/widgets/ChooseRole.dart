import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/DriverSignUpView.dart';
import 'package:yallanow/generated/l10n.dart';

class ChooseRole extends StatelessWidget {
  const ChooseRole({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Image.asset(Assets.imagesRiderIcon,
                height: AppSizes.getHeight(24, context),
                width: AppSizes.getWidth(24, context),
                fit: BoxFit.fill),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);

                NavigateToPage.slideFromRightAndFade(
                    context: context, page: const DriverSignUpView());
              },
              child: Text(
                S.of(context).SignUprider,
                style: AppStyles.styleMedium14(context),
              ),
            )
          ],
        ),
        // const Spacer(),
        // Row(
        //   children: [
        //     Image.asset(Assets.imagesPartnerIcon,
        //         height: AppSizes.getHeight(24, context),
        //         width: AppSizes.getWidth(24, context),
        //         fit: BoxFit.fill),
        //     const SizedBox(width: 12),
        //     GestureDetector(
        //       child: Text(
        //         "Sign up as a partner",
        //         style: AppStyles.styleMedium14(context),
        //       ),
        //     )
        //   ],
        // )
      ],
    );
  }
}
