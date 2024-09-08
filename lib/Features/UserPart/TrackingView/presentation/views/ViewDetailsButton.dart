import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/generated/l10n.dart';

class ViewDetailsButton extends StatefulWidget {
  const ViewDetailsButton({super.key});

  @override
  State<ViewDetailsButton> createState() => _ViewDetailsButtonState();
}

class _ViewDetailsButtonState extends State<ViewDetailsButton> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .7,
      child: Column(
        children: [
          ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            title: Text(S.of(context).ViewDetails,
                style: AppStyles.styleMedium16(context)
                    .copyWith(color: const Color(0xff5A5A5A))),
            trailing: ExpandIcon(
              isExpanded: isExpanded,
              onPressed: (bool value) {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
