import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/data/repo/CatpinProfileRepoImpl.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/presentation/manager/captin_details_cubit/captin_details_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/presentation/views/CaptinProfileViewBody.dart';
import 'package:yallanow/generated/l10n.dart';

class CaptinProfileView extends StatelessWidget {
  const CaptinProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CaptinDetailsCubit(getIt.get<CatpinProfileRepoImpl>())..get(),
      child: Scaffold(
        appBar: secondAppBar(context, title: S.of(context).CaptinProfile),
        body: const CaptinProfileViewBody(),
      ),
    );
  }
}
