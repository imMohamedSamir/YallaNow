import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/views/AddressesLV.dart';

class AddressesViewBody extends StatelessWidget {
  const AddressesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: AddressesLV(),
    );
  }
}
