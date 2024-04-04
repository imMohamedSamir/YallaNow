import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/ContactInfoSec.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/showOrderPlaced.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/NotesSec.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/PayMethodsSec.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 24),
              const ContactInfoSec(),
              const SizedBox(height: 16),
              const PayMethodsSec(),
              const SizedBox(height: 24),
              const NotesSec(),
              const SizedBox(height: 24),
              const OrderDetails(),
              const SizedBox(height: 24),
              CustomButton(
                text: "Checkout",
                txtcolor: Colors.white,
                btncolor: const Color(0xffB20404),
                onPressed: () {
                  showOrderPlaced(context);
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
