import 'package:flutter/material.dart';

class ItemPageBottomBar extends StatelessWidget {
  const ItemPageBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      title: Container(
        height: height * 0.065,
        width: width * 0.91,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xffB20404),
        ),
        child: const Row(
          children: [
            SizedBox(width: 10),
            Text(
              "Add to basket",
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
            Text(
              "Price on selection",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      tileColor: Colors.white,
    );
  }
}
