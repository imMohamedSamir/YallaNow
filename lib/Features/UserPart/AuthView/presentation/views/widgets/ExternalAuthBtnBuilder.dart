import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/CredentialModel.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/external_sign_up_cubit/external_sign_up_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

class ExternalAuthBtnBuilder extends StatelessWidget {
  const ExternalAuthBtnBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExternalSignUpCubit, ExternalSignUpState>(
      listener: (context, state) {
        if (state is ExternalSignUpFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMsg)));
        }
      },
      builder: (context, state) {
        if (state is ExternalSignUpLoading) {
          return const CircularProgressIndicator(color: pKcolor);
        } else {
          return _buildSignUpButton(context);
        }
      },
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return CustomButton(
      text: S.of(context).SignUp,
      txtcolor: Colors.white,
      btncolor: pKcolor,
      onPressed: () async {
        var cubit = BlocProvider.of<ExternalSignUpCubit>(context);
        CredentialModel credentialModel =
            await CredentialModel().getCredential() ?? CredentialModel();
        if (credentialModel.provider == 'facebook.com') {
          cubit.signUpWithFaceBook();
        } else {
          cubit.signUpWithGoogle();
        }
      },
    );
  }
}
