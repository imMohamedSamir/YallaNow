import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/ContactInfoCard.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Core/widgets/customButton.dart';

class NewAddressePage extends StatelessWidget {
  const NewAddressePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondAppBar(context, title: "New Addresse"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(children: [
            ContactInfoCard(
              height: AppSizes.getHeight(101, context),
              title: "Tagamomo 5",
              subtitle:
                  "EGP Lorem ipsum dolor sit amet ces tincidunt eleifend vitae",
              image: SvgPicture.asset(
                Assets.imagesLocationMark,
                height: AppSizes.getHeight(20, context),
                width: AppSizes.getWidth(20, context),
              ),
            ),
            const SizedBox(height: 16),
            ContactInfoCard(
                height: AppSizes.getHeight(55, context),
                title: "01112345678",
                image: Image.asset(
                  Assets.imagesPhoneIcon,
                  height: AppSizes.getHeight(20, context),
                  width: AppSizes.getWidth(20, context),
                )),
            const SizedBox(height: 16),
            const CustomTextField(hintText: "Address name (EX: Work)"),
            const SizedBox(height: 16),
            const CustomTextField(hintText: "street name"),
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(child: CustomTextField(hintText: "Building num")),
                SizedBox(width: 16),
                Expanded(child: CustomTextField(hintText: "Floor num *"))
              ],
            ),
            const SizedBox(height: 16),
            const CustomTextField(hintText: "Addition details *"),
            SizedBox(height: AppSizes.getHeight(130, context)),
            const CustomButton(
                text: "Save address",
                txtcolor: Colors.white,
                btncolor: Color(0xffB20404)),
            const SizedBox(height: 16),
          ]),
        ),
      ),
    );
  }
}
