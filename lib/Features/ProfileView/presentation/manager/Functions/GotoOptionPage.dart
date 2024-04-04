import 'package:flutter/material.dart';
import 'package:yallanow/Features/AddressesView/presentation/AddressesView.dart';
import 'package:yallanow/Features/FavoriteView/presentation/FavoriteView.dart';
import 'package:yallanow/Features/OrdersView/presentation/OredersView.dart';
import 'package:yallanow/Features/ProfileView/presentation/manager/Functions/shareApp.dart';
import 'package:yallanow/Features/ProfileView/presentation/views/EditProfilePage.dart';
import 'package:yallanow/Features/ProfileView/presentation/views/HelpCenterPage.dart';
import 'package:yallanow/Features/ProfileView/presentation/views/LanguagePage.dart';

void goToOptionPage({required int index, required BuildContext context}) {
  switch (index) {
    case 0:
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const EditProfilePage()));
      break;
    case 1:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const OrdersView()));
      break;
    case 2:
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => const OrdersView()));
      break;
    case 3:
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AddressesView()));
      break;
    case 4:
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const FavoriteView()));
      break;
    case 5:
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LanguagePage()));
      break;
    case 6:
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const HelpCenterPage()));
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
