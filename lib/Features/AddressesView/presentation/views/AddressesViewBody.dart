import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/AddressesView/presentation/views/AddresseButton.dart';
import 'package:yallanow/Features/AddressesView/presentation/views/AddressesLV.dart';

class AddressesViewBody extends StatelessWidget {
  const AddressesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondAppBar(context, title: "Addresses"),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Expanded(child: AddressesLV()),
      ),
      floatingActionButton: const AddresseButton(),
    );
  }
}
