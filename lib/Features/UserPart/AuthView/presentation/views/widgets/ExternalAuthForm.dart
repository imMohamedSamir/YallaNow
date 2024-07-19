import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Features/UserPart/AuthView/data/Models/external_auth_model/external_auth_model.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/external_sign_up_cubit/external_sign_up_cubit.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/ExternalAuthBtnBuilder.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/GenderDropMenu.dart';
import 'package:yallanow/generated/l10n.dart';

class ExternalAuthForm extends StatefulWidget {
  const ExternalAuthForm({super.key});

  @override
  State<ExternalAuthForm> createState() => _ExternalAuthFormState();
}

class _ExternalAuthFormState extends State<ExternalAuthForm> {
  late GlobalKey<FormState> _formKey;
  late ExternalAuthModel authModel;
  AutovalidateMode autovalidateModephone = AutovalidateMode.disabled;

  @override
  void initState() {
    authModel = BlocProvider.of<ExternalSignUpCubit>(context).authModel;
    _formKey = BlocProvider.of<ExternalSignUpCubit>(context).formKey;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Expanded(
          child: Column(
            children: [
              CustomTextField(
                autovalidateMode: autovalidateModephone,
                hintText: S.of(context).PhoneNumber,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return S.of(context).PhoneValidation;
                  }
                  if (value.length > 11 || value.length < 11) {
                    return S.of(context).correctPhoneNumber;
                  }
                  return null;
                },
                onChanged: (p0) {
                  setState(() {
                    autovalidateModephone = AutovalidateMode.onUserInteraction;
                  });
                },
                onSaved: (value) {
                  authModel.phoneNumber = value!.trim();
                },
              ),
              const Gap(16),
              Genderdropmenu(
                onChanged: (value) {
                  authModel.gender = value!.trim();
                },
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return S.of(context).GenderValidation;
                  }
                  return null;
                },
              ),
              const Spacer(),
              const ExternalAuthBtnBuilder(),
              const Gap(24),
            ],
          ),
        ));
  }
}
