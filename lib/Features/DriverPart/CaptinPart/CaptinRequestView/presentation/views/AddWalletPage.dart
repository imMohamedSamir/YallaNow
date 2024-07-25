import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinHomeView/data/Repo/CaptinRequestRepoImpl.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/manager/add_wallet_cubit/add_wallet_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/views/AddWalletPageBody.dart';
import 'package:yallanow/generated/l10n.dart';

class AddWalletPage extends StatelessWidget {
  const AddWalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddWalletCubit(getIt.get<CaptinRequestRepoImpl>()),
      child: Scaffold(
        appBar: secondAppBar(context, title: S.of(context).Wallet),
        body: const AddWalletPageBody(),
      ),
    );
  }
}
