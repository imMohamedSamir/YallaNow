import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/generated/l10n.dart';

class DividersWidget extends StatelessWidget {
  const DividersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            indent: 10,
            color: Colors.grey,
            thickness: 1,
            height: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            S.of(context).continuewith,
            style:
                AppStyles.styleMedium16(context).copyWith(color: Colors.grey),
          ),
        ),
        const Expanded(
          child: Divider(
            endIndent: 10,
            color: Colors.grey,
            thickness: 1,
            height: 1,
          ),
        ),
      ],
    );
  }
}
