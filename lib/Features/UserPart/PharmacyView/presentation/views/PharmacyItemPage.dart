import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyItemAppBar.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyItemDescription.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacyRelatedProductsSec.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/ItemPageBottomBar.dart';

class PharmacyItemPage extends StatelessWidget {
  const PharmacyItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PharmacyItemAppBar(),
            PharmacyItemDescription(),
            SizedBox(height: 10),
            Padding(
                padding: EdgeInsets.only(left: 16),
                child: PharmacyRelatedProductsSec())
          ],
        ),
      ),
      bottomNavigationBar: ItemPageBottomBar(),
    );
  }
}
