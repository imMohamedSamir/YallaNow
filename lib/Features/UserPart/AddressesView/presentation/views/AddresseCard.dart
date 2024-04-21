import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/AdressesCardModel.dart';

class AddresseCard extends StatelessWidget {
  const AddresseCard({super.key, required this.adressesCardModel});
  final AdressesCardModel adressesCardModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1.5, color: const Color(0xff5A5A5A))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(adressesCardModel.addresseName,
                  style: AppStyles.styleSemiBold16(context)
                      .copyWith(color: const Color(0xff240301))),
              const Spacer(),
              Row(
                children: [
                  Icon(Icons.edit, size: AppSizes.getHeight(22, context)),
                  const SizedBox(width: 4),
                  Text("Edit",
                      style: AppStyles.styleSemiBold16(context)
                          .copyWith(color: const Color(0xff5A5A5A)))
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            adressesCardModel.government,
            style: AppStyles.styleRegular14(context)
                .copyWith(color: const Color(0xff240301)),
          ),
          const SizedBox(height: 4),
          Text(adressesCardModel.street,
              style: AppStyles.styleRegular14(context)
                  .copyWith(color: const Color(0xff240301)))
        ],
      ),
    );
  }
}
