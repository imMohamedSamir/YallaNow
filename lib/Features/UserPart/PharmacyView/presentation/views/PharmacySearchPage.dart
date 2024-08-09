import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignUpAppBar.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/data/Repo/PharmacyRepoImpl.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/manager/pharmacy_search_cubit/pharmacy_search_cubit.dart';
import 'package:yallanow/Features/UserPart/PharmacyView/presentation/views/PharmacySearchPageBody.dart';
import 'package:yallanow/generated/l10n.dart';

class PharmacySearchPage extends StatelessWidget {
  const PharmacySearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PharmacySearchCubit(getIt.get<PharmacyRepoImpl>()),
      child: Scaffold(
        appBar:
            customAppBar(context, title: S.of(context).pharmacy, onPressed: () {
          Navigator.pop(context);
        }),
        body: const PharmacySearchPageBody(),
      ),
    );
  }
}
