import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/foodView/presentation/views/DialogButton.dart';

void dialogMethode(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Close without adding to basket?",
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff240301))),
        content: Text(
          "Your choices for this will be cleared. ",
          style: AppStyles.styleRegular16(context)
              .copyWith(color: const Color(0xff5A5A5A)),
        ),
        actions: [
          const DialogButton(
              btnColor: Colors.white,
              textColor: Color(0xffB20404),
              text: "Cancel"),
          DialogButton(
              btnColor: const Color(0xffB20404),
              textColor: Colors.white,
              text: 'Yes, close',
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              })
        ],
      );
    },
  );
}
