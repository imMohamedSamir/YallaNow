import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/LoginView.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/DialogButton.dart';

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

void logoutdialogMethode(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Logout of your account?",
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff240301))),
        actions: [
          const DialogButton(
              btnColor: Colors.white,
              textColor: Color(0xffB20404),
              text: "Cancel"),
          DialogButton(
              btnColor: const Color(0xffB20404),
              textColor: Colors.white,
              text: 'Log out',
              onPressed: () {
                removeToken();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
                    ),
                    (route) => false);
                // Navigator.pop(context);
                // Navigator.pop(context);
              })
        ],
      );
    },
  );
}

removeToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("token");
}

void cancelRidedialogMethode(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Are you want to cancel the ride?",
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff240301))),
        content: Text(
          "Your ride for this will be cancle.",
          style: AppStyles.styleRegular16(context)
              .copyWith(color: const Color(0xff5A5A5A)),
        ),
        actions: [
          const DialogButton(
              btnColor: Colors.white,
              textColor: Color(0xffB20404),
              text: "I will wait"),
          DialogButton(
              btnColor: const Color(0xffB20404),
              textColor: Colors.white,
              text: 'Cancel',
              onPressed: () {
                // Navigator.pop(context);
                // Navigator.pop(context);
              })
        ],
      );
    },
  );
}
