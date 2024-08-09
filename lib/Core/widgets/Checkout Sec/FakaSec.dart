import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/FakaCard.dart';
import 'package:yallanow/generated/l10n.dart';

class FakaSec extends StatelessWidget {
  const FakaSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(S.of(context).FakaMsg), Gap(16), FakaTypes()],
    );
  }
}

class FakaTypes extends StatelessWidget {
  const FakaTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(4, (inedx) {
        return FakaCard();
      }),
    );
  }
}
