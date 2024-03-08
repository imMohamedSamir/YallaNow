import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class dividersWidget extends StatelessWidget {
  const dividersWidget({super.key});

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
            'or continue with',
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
