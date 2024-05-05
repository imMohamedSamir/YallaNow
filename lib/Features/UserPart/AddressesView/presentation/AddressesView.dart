import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/Repo/AddressRepoImpl.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/delete_address_cubit/delete_address_cubit.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/views/AddresseButton.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/views/AddressesViewBody.dart';

class AddressesView extends StatelessWidget {
  const AddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteAddressCubit(getIt.get<AddressesRepoImpl>()),
      child: Scaffold(
        appBar: secondAppBar(context, title: "Addresses"),
        body: const AddressesViewBody(),
        floatingActionButton: const AddresseButton(),
      ),
    );
  }
}
