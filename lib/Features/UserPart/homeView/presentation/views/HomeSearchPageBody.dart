import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/SearchTextField.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FilterListView.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/HomeSearchResultSec.dart';

class HomeSearchPageBody extends StatelessWidget {
  const HomeSearchPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          HomeSearchTextField(),
          SizedBox(height: 24),
          // FilterListView(),
          // SizedBox(height: 16),
          HomeSearchResultSec()
        ],
      ),
    );
  }
}
