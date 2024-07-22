import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing/printing.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinProfileView/presentation/manager/captin_pdf_cubit/captin_pdf_cubit.dart';

class CaptinpdfviewerBody extends StatelessWidget {
  const CaptinpdfviewerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CaptinPdfCubit, CaptinPdfState>(
      builder: (context, state) {
        if (state is CaptinPdfSuccess) {
          return PdfPreview(
            loadingWidget:
                const Center(child: CircularProgressIndicator(color: pKcolor)),
            actionBarTheme: const PdfActionBarTheme(backgroundColor: pKcolor),
            dynamicLayout: false,
            canDebug: false,
            canChangeOrientation: false,
            canChangePageFormat: false,
            build: (format) => state.pdf,
          );
        } else if (state is CaptinPdfFailure) {
          return Center(
            child: Text(
              state.errMsg,
              style: AppStyles.styleBold18(context),
            ),
          );
        } else if (state is CaptinPdfLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: pKcolor,
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
