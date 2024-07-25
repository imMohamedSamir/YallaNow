import 'package:flutter/material.dart';
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
          backgroundColor:
              WidgetStateProperty.all<Color?>(const Color(0xffB20404))),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddressMapView(),
            ));
      },
      icon: const Icon(Icons.add, color: Colors.white),
    );
  }
}
