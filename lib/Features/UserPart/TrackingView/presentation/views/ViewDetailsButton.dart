import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class ViewDetailsButton extends StatelessWidget {
  const ViewDetailsButton({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .7,
      child: ListTile(
        onTap: onTap,
        title: Text(
          "View details",
          style: AppStyles.styleMedium16(context)
              .copyWith(color: const Color(0xff5A5A5A)),
        ),
        trailing: const Icon(Icons.keyboard_arrow_down_rounded),
      ),
    );
  }
}
