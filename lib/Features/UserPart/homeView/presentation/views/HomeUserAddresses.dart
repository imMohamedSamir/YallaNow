import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/user_addresses_details_model/user_addresses_details_model.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/user_addresses_cubit/user_addresses_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/HomeAddressCard.dart';

class HomeUserAddresses extends StatelessWidget {
  const HomeUserAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserAddressesCubit, UserAddressesState>(
      builder: (context, state) {
        if (state is UserAddressesSuccess) {
          List<UserAddressesDetailsModel> addresses = state.addresses;
          return Column(
            children: List.generate(
                addresses.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: HomeAddressCard(address: addresses[index]),
                    )),
          );
        }
        if (state is UserAddressesEmpty) {
          return Column(
            children: [
              Text("There is no addresses , Add one",
                  style: AppStyles.styleSemiBold14(context)),
              const SizedBox(height: 12)
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
