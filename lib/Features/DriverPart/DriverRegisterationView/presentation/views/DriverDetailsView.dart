import 'package:flutter/material.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/views/DriverDetailsViewBody.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/SignupTerms.dart';
import 'package:yallanow/generated/l10n.dart';

class DriverDetailsView extends StatelessWidget {
  const DriverDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondAppBar(context, title: S.of(context).Driverdetails),
      body: const DriverDetailsViewBody(),
      bottomNavigationBar: const SignupTerms(),
    );
  }
}
