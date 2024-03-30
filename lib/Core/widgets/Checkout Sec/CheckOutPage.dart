import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/ContactInfoSec.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/PayMethodsSec.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/AuthView/presentation/views/widgets/SignUpAppBar.dart';
import 'package:yallanow/Features/foodView/presentation/views/OrderDetails.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basketCustomAppBar(context, title: "Checkout", onPressed: () {
        Navigator.pop(context);
      }),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 24),
              ContactInfoSec(),
              SizedBox(height: 16),
              PayMethodsSec(),
              SizedBox(height: 24),
              NotesSec(),
              SizedBox(height: 24),
              OrderDetails(),
              SizedBox(height: 24),
              CustomButton(
                  text: "Checkout",
                  txtcolor: Colors.white,
                  btncolor: Color(0xffB20404)),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class NotesSec extends StatelessWidget {
  const NotesSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Notes",
                style: AppStyles.styleSemiBold16(context)
                    .copyWith(color: const Color(0xff240301))),
            const Spacer(),
            Container(
              width: AppSizes.getWidth(76, context),
              height: AppSizes.getHeight(23, context),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: ShapeDecoration(
                color: const Color(0xFFF5F5F5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text('Optional',
                  style: AppStyles.styleMedium10(context)
                      .copyWith(color: const Color(0xff5A5A5A))),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const CustomTextField(
          hintText: "Add notes",
        )
      ],
    );
  }
}
