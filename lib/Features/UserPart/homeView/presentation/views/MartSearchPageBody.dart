import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/widgets/SearchTextField.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FilterListView.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/MartSearchResultSec.dart';

class MartSearchPageBody extends StatelessWidget {
  const MartSearchPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          MartsSearchTextField(),
          Gap(24),
          FilterListView(),
          Gap(16),
          MartSearchResultSec()
        ],
      ),
    );
  }
}
