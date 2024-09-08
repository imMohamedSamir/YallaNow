import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/views/AddreseeMap.dart';

class AddresseButton extends StatelessWidget {
  const AddresseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: BoxConstraints.tight(const Size(56, 56)),
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color?>(pKcolor)),
      onPressed: () {
        NavigateToPage.slideFromRight(
            context: context, page: const AddressMapView());
      },
      icon: const Icon(Icons.add, color: Colors.white),
    );
  }
}
