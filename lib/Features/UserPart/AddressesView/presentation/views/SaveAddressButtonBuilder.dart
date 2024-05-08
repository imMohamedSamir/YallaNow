import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/UserInputAddressModel.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/add_user_address_cubit/add_user_address_cubit.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/user_addresses_cubit/user_addresses_cubit.dart';

class SaveAddressButtonBuilder extends StatelessWidget {
  const SaveAddressButtonBuilder({
    super.key,
    required this.userAddress,
    required this.formKey,
    required this.scaffoldKey,
  });
  final UserInputAddressModel userAddress;
  final GlobalKey<FormState> formKey;
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddUserAddressCubit, AddUserAddressState>(
      listener: (context, state) {
        if (state is AddUserAddressSuccess) {
          showSnackBar(context);
          BlocProvider.of<UserAddressesCubit>(context).getUserAddresses();
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<AddUserAddressCubit>(context);
        if (state is AddUserAddressLoading) {
          return const CircularProgressIndicator(color: pKcolor);
        } else if (state is AddUserAddressFailure) {
          return Column(
            children: [
              Text(state.errMsg, style: AppStyles.styleSemiBold14(context)),
              const SizedBox(height: 8),
              CustomButton(
                text: "Save address",
                txtcolor: Colors.white,
                btncolor: pKcolor,
                onPressed: () {
                  cubit.addAddress(newaddress: userAddress);
                },
              )
            ],
          );
        } else if (state is AddUserAddressSuccess) {
          return CustomButton(
            text: "Save address",
            txtcolor: Colors.white,
            btncolor: pKcolor,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                cubit.addAddress(newaddress: userAddress);
              }
            },
          );
        } else {
          return CustomButton(
            text: "Save address",
            txtcolor: Colors.white,
            btncolor: pKcolor,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                cubit.addAddress(newaddress: userAddress);
              }
            },
          );
        }
      },
    );
  }
}

void showSnackBar(BuildContext context) {
  SnackBar snackBar = SnackBar(
    content: Text("Address Added!",
        style:
            AppStyles.styleSemiBold14(context).copyWith(color: Colors.white)),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
