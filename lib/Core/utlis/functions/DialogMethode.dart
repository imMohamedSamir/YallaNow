import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/LoginView.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/item_page_cubit/item_page_cubit.dart';
import 'package:yallanow/Features/UserPart/foodView/presentation/views/DialogButton.dart';

void dialogMethode(BuildContext context, {String? itemId}) {
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
              btnColor: Colors.white, textColor: pKcolor, text: "Cancel"),
          DialogButton(
              btnColor: pKcolor,
              textColor: Colors.white,
              text: 'Yes, close',
              onPressed: () {
                if (itemId != null) {
                  BlocProvider.of<BasketManagerCubit>(context)
                      .deleteFromBasket(itemId);
                  Navigator.pop(context);
                  Navigator.pop(context);
                } else {
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
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
              btnColor: Colors.white, textColor: pKcolor, text: "Cancel"),
          DialogButton(
              btnColor: pKcolor,
              textColor: Colors.white,
              text: 'Log out',
              onPressed: () {
                removeToken();
                BlocProvider.of<BasketManagerCubit>(context).clearBasket();
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
              btnColor: Colors.white, textColor: pKcolor, text: "I will wait"),
          DialogButton(
              btnColor: pKcolor,
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

void clearTheBasketDialog(BuildContext context, {String? itmeId}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("A new order will clear the basket?",
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff240301))),
        content: Text(
          "your basket itmes will be cleared.",
          style: AppStyles.styleRegular16(context)
              .copyWith(color: const Color(0xff5A5A5A)),
        ),
        actions: [
          DialogButton(
            btnColor: Colors.white,
            textColor: pKcolor,
            text: "Cancel",
            onPressed: () {
              BlocProvider.of<BasketManagerCubit>(context)
                  .deleteFromBasket(itmeId!);
              Navigator.pop(context);
            },
          ),
          DialogButton(
              btnColor: pKcolor,
              textColor: Colors.white,
              text: 'OK',
              onPressed: () {
                BlocProvider.of<BasketManagerCubit>(context)
                    .clearAndAdd(itemID: itmeId);
                Navigator.pop(context);
                Navigator.pop(context);
              })
        ],
      );
    },
  );
}

void clearTheBasketDialogInPage(BuildContext context, {String? itmeId}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("A new order will clear the basket?",
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff240301))),
        content: Text(
          "your basket itmes will be cleared.",
          style: AppStyles.styleRegular16(context)
              .copyWith(color: const Color(0xff5A5A5A)),
        ),
        actions: [
          DialogButton(
            btnColor: Colors.white,
            textColor: pKcolor,
            text: "Cancel",
            onPressed: () {
              BlocProvider.of<BasketManagerCubit>(context)
                  .deleteFromBasket(itmeId!);
              Navigator.pop(context);
            },
          ),
          DialogButton(
              btnColor: pKcolor,
              textColor: Colors.white,
              text: 'OK',
              onPressed: () {
                BlocProvider.of<BasketManagerCubit>(context)
                    .clearAndAdd(itemID: itmeId);
                // BlocProvider.of<ItemPageCubit>(context)
                //     .addToBasket(itemID: itmeId!);
                Navigator.pop(context);
              })
        ],
      );
    },
  );
}

void checkoutDialog(BuildContext context, {String? msg}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Invalid Transaction",
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff240301))),
        content: Text(
          msg ?? '',
          style: AppStyles.styleRegular16(context)
              .copyWith(color: const Color(0xff5A5A5A)),
        ),
        actions: [
          DialogButton(
            btnColor: pKcolor,
            textColor: Colors.white,
            text: "ok",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
