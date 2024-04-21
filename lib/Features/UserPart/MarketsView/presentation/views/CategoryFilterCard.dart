import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class CategoryFilterCard extends StatelessWidget {
  const CategoryFilterCard(
      {super.key, required this.isActive, required this.type});
  final bool isActive;
  final String type;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: AppSizes.getWidth(50, context),
      height: AppSizes.getHeight(30, context),
      decoration: BoxDecoration(
        border: isActive
            ? null
            : Border.all(color: const Color(0xff5A5A5A), width: 1),
        borderRadius: BorderRadius.circular(16),
        color: isActive ? const Color(0xffB20404) : null,
      ),
      child: Center(
        child: Text(
          type,
          style: AppStyles.styleRegular14(context)
              .copyWith(color: isActive ? null : const Color(0xff5A5A5A)),
        ),
      ),
    );
  }
}
