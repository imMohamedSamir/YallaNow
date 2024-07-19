import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/register_model.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/registeration_cubit/registeration_cubit.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/LoginView.dart';
import 'package:yallanow/generated/l10n.dart';

class SignupFormButtonBuilder extends StatelessWidget {
  const SignupFormButtonBuilder({
    super.key,
    required this.formKey,
    required this.registerModel,
  });

  final GlobalKey<FormState> formKey;
  final UserRegisterModel registerModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterationCubit, RegisterationState>(
      listener: (context, state) {
        if (state is RegisterationSuccess && state.respons == '["User"]') {
          NavigateToPage.slideFromRight(
              context: context, page: const LoginView());
        }
      },
      builder: (context, state) {
        if (state is RegisterationLoading) {
          return const CircularProgressIndicator(color: pKcolor);
        } else {
          return Column(
            children: [
              if (state is RegisterationFailure)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    state.failmsg,
                    style: AppStyles.styleRegular16(context)
                        .copyWith(color: pKcolor),
                  ),
                ),
              CustomButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    await BlocProvider.of<RegisterationCubit>(context)
                        .fetchRegisteration(userdata: registerModel);
                  }
                },
                text: S.of(context).SignUp,
                txtcolor: Colors.white,
                btncolor: pKcolor,
              ),
            ],
          );
        }
      },
    );
  }
}
