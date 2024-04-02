import 'package:flutter/material.dart';
import 'package:yallanow/Features/AddressesView/presentation/views/NewAddressePage.dart';

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
              MaterialStateProperty.all<Color?>(const Color(0xffB20404))),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewAddressePage(),
            ));
      },
      icon: const Icon(Icons.add, color: Colors.white),
    );
  }
}
