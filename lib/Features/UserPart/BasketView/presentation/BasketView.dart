import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignUpAppBar.dart';
import 'package:yallanow/Features/UserPart/BasketView/data/Repo/BasketRepoImpl.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/add_basket_cubit/add_basket_cubit.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/views/BasketViewBody.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddBasketCubit(getIt.get<BasketRepoImpl>()),
      child: Scaffold(
        appBar: basketCustomAppBar(context, title: "Basket", onPressed: () {
          Navigator.pop(context);
        }),
        body: const BasketViewBody(),
      ),
    );
  }
}
