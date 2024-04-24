import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/ContactInfoCard.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Core/widgets/customButton.dart';

class NewAddressePage extends StatelessWidget {
  const NewAddressePage({
    super.key,
    required this.title,
    required this.dsc,
  });
  final String title, dsc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondAppBar(context, title: "New Addresse"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(children: [
            CustomTextField(
              hintText: "",
              maxLines: 2,
              prefixIcon: const Icon(Icons.location_pin),
              initialValue: '$title\n$dsc',
              readOnly: true,
              suffixIcon: MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: Text(
                  "Change",
                  style: AppStyles.styleMedium12(context)
                      .copyWith(color: const Color(0xffB20404)),
                ),
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
