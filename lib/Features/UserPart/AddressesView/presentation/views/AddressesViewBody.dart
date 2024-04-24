import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/views/AddresseButton.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/views/AddressesLV.dart';

class AddressesViewBody extends StatelessWidget {
  const AddressesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondAppBar(context, title: "Addresses"),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: AddressesLV(),
      ),
      floatingActionButton: const AddresseButton(),
    );
  }
}
