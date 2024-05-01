import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/FilterListCard.dart';

class FilterListView extends StatelessWidget {
  const FilterListView({super.key});
  static List<String> filters = ["Free delivery", "Reating"];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(32, context),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const FilterListMainCard(),
            const SizedBox(width: 16),
            ...List.generate(
                filters.length,
                (index) => Padding(
                    padding: EdgeInsets.only(
                        right: index == filters.length - 1 ? 0 : 16),
                    child: FilterListCard(filterType: filters[index])))
          ],
        ),
      ),
    );
  }
}
