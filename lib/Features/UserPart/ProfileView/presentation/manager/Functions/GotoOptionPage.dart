import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/presentation/CaptinProfileView.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/presentation/views/CaptinVehicleDetaisView.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/manager/Functions/shareApp.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/EditProfilePage.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/HelpCenterPage.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/LanguagePage.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/PrivacyPolicyPage.dart';

void goToOptionPage({required int index, required BuildContext context}) {
  switch (index) {
    case 0:
      NavigateToPage.slideFromRight(
          context: context, page: const EditProfilePage());
      break;
    // case 1:
    //   NavigateToPage.slideFromRight(context: context, page: const OrdersView());
    //   break;
    // case 2:
    //   // Handle case 2 if necessary
    //   break;
    // case 3:
    //   NavigateToPage.slideFromRight(
    //       context: context, page: const AddressesView());
    //   break;
    // case 4:
    //   NavigateToPage.slideFromRight(
    //       context: context, page: const FavoriteView());
    //   break;
    case 1:
      NavigateToPage.slideFromRight(
          context: context, page: const LanguagePage());
      break;
    case 2:
      NavigateToPage.slideFromRight(
          context: context, page: const HelpCenterPage());
      break;
    case 3:
      shareApp();
      break;
    case 4:
      NavigateToPage.slideFromRight(
          context: context, page: const PrivacyPolicyPage());
      break;
    // Add cases for other indexes as needed
    default:
      // Handle the default case if needed
      break;
  }
}

void deliveryGoToOptionPage(
    {required int index, required BuildContext context}) {
  switch (index) {
    case 0:
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => const EditProfilePage()));
      break;
    case 1:
      NavigateToPage.slideFromRight(
          context: context, page: const LanguagePage());
      break;
    case 2:
      NavigateToPage.slideFromRight(
          context: context, page: const HelpCenterPage());
      break;
    case 3:
      NavigateToPage.slideFromRight(
          context: context, page: const PrivacyPolicyPage());
      break;

    case 7:
      shareApp();
      break;
    // Add cases for other indexes as needed
    default:
      // Handle the default case if needed
      break;
  }
}

void captinGoToOptionPage({required int index, required BuildContext context}) {
  switch (index) {
    case 0:
      NavigateToPage.slideFromRight(
          context: context, page: const CaptinProfileView());
      break;
    case 1:
      NavigateToPage.slideFromRight(
          context: context, page: const CaptinVehicleDetaisView());
      break;
    case 2:
      NavigateToPage.slideFromRight(
          context: context, page: const LanguagePage());
      break;
    case 3:
      NavigateToPage.slideFromRight(
          context: context, page: const HelpCenterPage());
      break;
    case 4:
      NavigateToPage.slideFromRight(
          context: context, page: const PrivacyPolicyPage());
      break;

    case 7:
      shareApp();
      break;
    // Add cases for other indexes as needed
    default:
      // Handle the default case if needed
      break;
  }
}
