import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Features/MarketsView/presentation/views/CategoryFilterCard.dart';

class CategoryFilterLV extends StatefulWidget {
  const CategoryFilterLV({super.key});

  @override
  State<CategoryFilterLV> createState() => _CategoryFilterLVState();
}

class _CategoryFilterLVState extends State<CategoryFilterLV> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(30, context),
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    activeIndex = index;
                  });
                },
                child: CategoryFilterCard(
                  type: "All",
                  isActive: index == activeIndex,
                )),
          );
        },
      ),
    );
  }
}
