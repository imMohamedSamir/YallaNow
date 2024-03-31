import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/MarketsView/presentation/views/AllCategoriesPage.dart';

class CategoriesHeader extends StatelessWidget {
  const CategoriesHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Categories", style: AppStyles.styleMedium16(context)),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 300),
                pageBuilder: (context, animation, secondaryAnimation) {
                  return FadeTransition(
                    opacity: animation,
                    child: const AllCategoriesPage(),
                  );
                },
              ),
            );
          },
          child: Text("View All",
              style: AppStyles.styleMedium12(context)
                  .copyWith(color: const Color(0xffB20404))),
        )
      ],
    );
  }
}
