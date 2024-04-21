import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/CheckoutButtonBuilder.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/ContactInfoSec.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/NotesSec.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/PayMethodsSec.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/OrderDetails.dart';

class CheckoutBody extends StatelessWidget {
  const CheckoutBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
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
            CheckoutButtonBuilder(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
