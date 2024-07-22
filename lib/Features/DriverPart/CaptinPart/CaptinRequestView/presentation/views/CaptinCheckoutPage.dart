import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/presentation/CaptinHomeView.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/views/AddWalletPage.dart';
import 'package:yallanow/generated/l10n.dart';

class CaptinCheckoutPage extends StatelessWidget {
  const CaptinCheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CaptinCheckoutBody(),
    );
  }
}

class CaptinCheckoutBody extends StatelessWidget {
  const CaptinCheckoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 100),
      child: Column(
        children: [
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26)),
              elevation: 15,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 64),
                child: Column(
                  children: [
                    Text(
                      S.of(context).usercharges,
                      style: AppStyles.styleMedium18(context),
                    ),
                    const SizedBox(height: 16),
                    Text("350 EGP",
                        style: AppStyles.styleBold18(context)
                            .copyWith(fontSize: 28)),
                    const SizedBox(height: 32),
                    CustomButton(
                      text: S.of(context).Checkout,
                      txtcolor: Colors.white,
                      btncolor: pKcolor,
                      onPressed: () {
                        Navigator.pop(context);
                        NavigateToPage.slideFromLeft(
                            context: context, page: const CaptinHomeView());
                      },
                    ),
                    const SizedBox(height: 32),
                    CustomButton(
                      text: S.of(context).addToWallet,
                      txtcolor: Colors.white,
                      btncolor: pKcolor,
                      onPressed: () {
                        NavigateToPage.slideFromRight(
                            context: context, page: const AddWalletPage());
                      },
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
