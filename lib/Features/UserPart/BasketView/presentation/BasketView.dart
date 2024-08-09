import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/Repo/BasketRepoImpl.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/add_basket_cubit/add_basket_cubit.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/views/BasketViewBody.dart';
import 'package:yallanow/generated/l10n.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddBasketCubit(getIt.get<BasketRepoImpl>()),
      child: Scaffold(
        appBar: secondAppBar(context, title: S.of(context).Basket),
        body: const BasketViewBody(),
      ),
    );
  }
}
