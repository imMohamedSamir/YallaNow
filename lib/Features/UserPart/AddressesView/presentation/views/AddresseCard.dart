import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/user_addresses_details_model/user_addresses_details_model.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/delete_address_cubit/delete_address_cubit.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/user_addresses_cubit/user_addresses_cubit.dart';

class AddresseCard extends StatelessWidget {
  const AddresseCard({super.key, required this.userAddress});
  final UserAddressesDetailsModel userAddress;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      direction: DismissDirection.endToStart,
      key: UniqueKey(),
      onDismissed: (direction) async {
        await BlocProvider.of<DeleteAddressCubit>(context).deleteAddress(
            addressId: userAddress.id!,
            useraddressId: userAddress.contact!.id!);
        BlocProvider.of<UserAddressesCubit>(context).getUserAddresses();
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1.5, color: const Color(0xff5A5A5A))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(userAddress.contact?.label ?? '',
                    style: AppStyles.styleSemiBold16(context)
                        .copyWith(color: const Color(0xff240301))),
                const Spacer(),
                InkWell(
                  borderRadius: BorderRadius.circular(6),
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(Icons.edit, size: AppSizes.getHeight(22, context)),
                      const SizedBox(width: 4),
                      Text("Edit",
                          style: AppStyles.styleSemiBold16(context)
                              .copyWith(color: const Color(0xff5A5A5A)))
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              userAddress.city ?? "",
              style: AppStyles.styleRegular14(context)
                  .copyWith(color: const Color(0xff240301)),
            ),
            const SizedBox(height: 4),
            Text(userAddress.street ?? "",
                style: AppStyles.styleRegular14(context)
                    .copyWith(color: const Color(0xff240301)))
          ],
        ),
      ),
    );
  }
}
