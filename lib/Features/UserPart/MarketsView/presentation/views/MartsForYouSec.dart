import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/MarketsView/presentation/views/GroceryListView.dart';
import 'package:yallanow/generated/l10n.dart';

class MartsForYouSec extends StatelessWidget {
  const MartsForYouSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).ForYou, style: AppStyles.styleMedium16(context)),
        const SizedBox(height: 16),
        const GroceryListView()
      ],
    );
  }
}
