import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/HomeAddressOption.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/HomeUserAddresses.dart';

class HomeAddressList extends StatelessWidget {
  const HomeAddressList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SingleChildScrollView(
          child: Column(children: [
        Text("Addresses",
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0xff240301))),
        const SizedBox(height: 16),
        const HomeUserAddresses(),
        const HomeAddressOption(
            title: 'Current location', isAddDifferentAddress: false),
        const SizedBox(height: 12),
        const HomeAddressOption(
            title: 'Different location', isAddDifferentAddress: true)
      ])),
    );
  }
}
