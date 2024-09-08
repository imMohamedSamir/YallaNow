import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/scaffoldMsgMethod.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/add_user_address_cubit/add_user_address_cubit.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/user_addresses_cubit/user_addresses_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

class SaveAddressButtonBuilder extends StatelessWidget {
  const SaveAddressButtonBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddUserAddressCubit, AddUserAddressState>(
      listener: (context, state) {
        if (state is AddUserAddressSuccess) {
          ScaffoldMsgMethod.showMsg(context, msg: S.of(context).AddressAdded);
          BlocProvider.of<UserAddressesCubit>(context).getUserAddresses();
        } else if (state is AddUserAddressFailure) {
          ScaffoldMsgMethod.showMsg(context,
              msg: S.of(context).AddressErrMsg, isError: true);
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<AddUserAddressCubit>(context);
        if (state is AddUserAddressLoading) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: CircularProgressIndicator(color: pKcolor),
          );
        } else {
          return _customButton(cubit, context);
        }
      },
    );
  }

  Widget _customButton(AddUserAddressCubit cubit, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: CustomButton(
        text: S.of(context).SaveAddress,
        txtcolor: Colors.white,
        btncolor: pKcolor,
        onPressed: () {
          cubit.addAddress();
        },
      ),
    );
  }
}
