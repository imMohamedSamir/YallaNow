import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/SearchTextField.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacySearchResultSec.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FilterListView.dart';

class PharmacySearchPageBody extends StatelessWidget {
  const PharmacySearchPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          PharmacySearchTextField(),
          SizedBox(height: 24),
          // FilterListView(),
          // SizedBox(height: 16),
          PharmacySearchResultSec()
        ],
      ),
    );
  }
}
