import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
  });

  final WidgetBuilder mobileLayout, tabletLayout;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth < 800) {
        return mobileLayout(context);
      } else if (constrains.maxWidth < 1200) {
        return tabletLayout(context);
      } else {
        return const SizedBox();
      }
    });
  }
}
