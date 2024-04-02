import 'package:flutter/material.dart';
import 'package:yallanow/Features/AddressesView/data/models/AdressesCardModel.dart';
import 'package:yallanow/Features/AddressesView/presentation/views/AddresseCard.dart';

class AddressesLV extends StatelessWidget {
  const AddressesLV({super.key});
  static List<AdressesCardModel> addresses = [
    AdressesCardModel(
        addresseName: "Home",
        government: "cairo",
        street: "229 Arabella, Cairo, Egypt."),
    AdressesCardModel(
        addresseName: "Work",
        government: "Hurghada",
        street: "229 Arabella, Cairo, Egypt."),
    AdressesCardModel(
        addresseName: "Home",
        government: "cairo",
        street: "229 Arabella, Cairo, Egypt."),
    AdressesCardModel(
        addresseName: "Work",
        government: "Hurghada",
        street:
            "229 Arabella, Cairo, Egypt.229 Arabella, Cairo, Egypt.229 Arabella, Cairo, Egypt.229 Arabella, Cairo, Egypt."),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: addresses.length,
      itemBuilder: (context, index) {
        final isLastIndex = index == addresses.length - 1;
        return Padding(
          padding: EdgeInsets.only(bottom: isLastIndex ? 0 : 16),
          child: AddresseCard(
            adressesCardModel: addresses[index],
          ),
        );
      },
    );
  }
}
