import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/PharmacyView/presentation/views/PharmacyCategoryGVSec.dart';

class PharmacyCategoryPage extends StatelessWidget {
  const PharmacyCategoryPage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CategoryAppBar(context, title: "Pharmacy", isCategory: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: PharmacyCategoryGVSec(
              title: title,
            )),
          ],
        ),
      ),
    );
  }
}
