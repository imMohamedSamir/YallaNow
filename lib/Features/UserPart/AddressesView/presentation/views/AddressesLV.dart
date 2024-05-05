import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/user_addresses_details_model/user_addresses_details_model.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/user_addresses_cubit/user_addresses_cubit.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/views/AddresseCard.dart';

class AddressesLV extends StatelessWidget {
  const AddressesLV({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserAddressesCubit, UserAddressesState>(
      builder: (context, state) {
        if (state is UserAddressesSuccess) {
          List<UserAddressesDetailsModel> userAddresses = state.addresses;
          return ListView.builder(
            itemCount: userAddresses.length,
            itemBuilder: (context, index) {
              final isLastIndex = index == userAddresses.length - 1;
              return Padding(
                padding: EdgeInsets.only(bottom: isLastIndex ? 0 : 16),
                child: AddresseCard(
                  userAddress: userAddresses[index],
                ),
              );
            },
          );
        } else if (state is UserAddressesLoading) {
          return const CircularProgressIndicator();
        } else if (state is UserAddressesFailure) {
          return Center(
              child: Text(
            state.errMsg,
            style: AppStyles.styleSemiBold16(context),
          ));
        } else if (state is UserAddressesEmpty) {
          return Center(
              child: Text(
            "There is no address, please add a new address :)",
            style: AppStyles.styleSemiBold14(context),
          ));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
