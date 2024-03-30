import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/CheckOutPage.dart';
import 'package:yallanow/Features/foodView/presentation/views/FoodResturantPage.dart';

class BasketButtonsSec extends StatelessWidget {
  const BasketButtonsSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            isBasket: true,
            text: "Add items",
            txtcolor: const Color(0xffB20404),
            btncolor: Colors.white,
            onPressed: () {
              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const FoodResturantPage(),
              //     ));
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FoodResturantPage(),
                  ));
            },
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: CustomButton(
            text: "Checkout",
            txtcolor: Colors.white,
            btncolor: const Color(0xffB20404),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckOutPage(),
                  ));
            },
          ),
        )
      ],
    );
  }
}
