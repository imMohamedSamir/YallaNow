import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/BasketView.dart';

class BasketIconBuilder extends StatelessWidget {
  const BasketIconBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Badge(
        label: Text("0"),
        child: Icon(
          Icons.shopping_cart_outlined,
          color: Color(0xff240301),
        ),
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BasketPage()));
      },
    );
  }
}
