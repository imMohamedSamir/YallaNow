import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/data/repo/CatpinProfileRepoImpl.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/presentation/manager/captin_pdf_cubit/captin_pdf_cubit.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/presentation/views/CaptinpdfviewerBody.dart';
import 'package:yallanow/generated/l10n.dart';

class CaptinPDFviewer extends StatelessWidget {
  const CaptinPDFviewer({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CaptinPdfCubit(getIt.get<CatpinProfileRepoImpl>())..get(),
      child: Scaffold(
        appBar: secondAppBar(context, title: S.of(context).driverPapers),
        body: const CaptinpdfviewerBody(),
      ),
    );
  }
}
