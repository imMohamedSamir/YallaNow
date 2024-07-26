import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/prom_code_cubit/prom_code_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

class PromoCodeField extends StatelessWidget {
  const PromoCodeField({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<PromCodeCubit>(context).key,
      child: BlocBuilder<PromCodeCubit, PromCodeState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).PromoCode,
                  style: AppStyles.styleMedium16(context)),
              const Gap(16),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomTextField(
                      controller: BlocProvider.of<PromCodeCubit>(context)
                          .codeController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      hintText: S.of(context).PromoCodeMsg,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).promoCodeValidate;
                        }
                        if (value.length < 8 || value.length > 8) {
                          return S.of(context).promoCodeCorrect;
                        }
                        return null;
                      },
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                      child: CustomButton(
                    text: S.of(context).apply,
                    txtcolor: Colors.white,
                    btncolor: pKcolor,
                    onPressed: () {
                      BlocProvider.of<PromCodeCubit>(context).apply();
                    },
                  ))
                ],
              ),
              if (state is PromCodeFailure)
                Text(
                  state.errMsg,
                  style:
                      AppStyles.styleMedium14(context).copyWith(color: pKcolor),
                )
              else if (state is PromCodeApplied)
                Text(
                  S.of(context).PromoCodeSuccess,
                  style: AppStyles.styleMedium14(context)
                      .copyWith(color: Colors.green),
                )
            ],
          );
        },
      ),
    );
  }
}
