import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class HelpCenterCard extends StatelessWidget {
  const HelpCenterCard({
    super.key,
    required this.title,
    required this.child,
    this.onTap,
  });
  final String title;
  final Widget child;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(72, context),
      child: Card(
        elevation: 0.2,
        child: ListTile(
          onTap: onTap,
          leading: child,
          title: Text(title,
              textDirection: TextDirection.ltr,
              style: AppStyles.styleBold18(context)
                  .copyWith(color: const Color(0xff212121))),
        ),
      ),
    );
  }
}
