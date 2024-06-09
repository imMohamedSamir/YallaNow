import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/ChooseAddress.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/AddressesView.dart';

class HomeAddressOption extends StatelessWidget {
  const HomeAddressOption({
    super.key,
    required this.title,
    required this.isAddDifferentAddress,
  });
  final String title;
  final bool isAddDifferentAddress;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (isAddDifferentAddress) {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddressesView()));
        } else {
          checkUserAddresses(context);
        }
      },
      shape: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff5A5A5A)),
          borderRadius: BorderRadius.circular(8)),
      leading: isAddDifferentAddress
          ? const Icon(Icons.add)
          : const Icon(Icons.my_location),
      title: Text(
        title,
        style: AppStyles.styleMedium16(context).copyWith(color: scColor),
      ),
    );
  }
}
