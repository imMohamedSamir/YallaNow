import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/DriverPart/CaptinPart/CaptinRequestView/presentation/manager/add_wallet_cubit/add_wallet_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

class AddWalletPageBody extends StatelessWidget {
  const AddWalletPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: BlocProvider.of<AddWalletCubit>(context).key,
        child: BlocConsumer<AddWalletCubit, AddWalletState>(
          listener: (context, state) {
            if (state is AddWalletSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    S.of(context).addWalletSuccessMsg,
                    style: AppStyles.styleMedium16(context)
                        .copyWith(color: Colors.white),
                  )));
            } else if (state is AddWalletFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    backgroundColor: pKcolor,
                    content: Text(
                      state.errMsg,
                      style: AppStyles.styleMedium16(context)
                          .copyWith(color: Colors.white),
                    )),
              );
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(16),
                CustomTextField(
                  hintText: "0.00",
                  keyboardType: TextInputType.number,
                  autovalidateMode:
                      state is AddWalletChange ? state.autovalidateMode : null,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(S.of(context).EGP,
                        style: AppStyles.styleBold16(context)),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return S.of(context).addWalletValidation;
                    }
                    return null;
                  },
                  onChanged: (value) {
                    if (value.isNotEmpty || double.tryParse(value) != 0) {
                      BlocProvider.of<AddWalletCubit>(context)
                          .calculateTheValue(context,
                              userValue: double.tryParse(value) ?? 0);
                    }
                  },
                ),
                const Gap(8),
                Text(
                  S.of(context).CaptinwalletMsg,
                  style: AppStyles.styleRegular14(context)
                      .copyWith(color: scColor),
                ),
                const Gap(16),
                if (state is AddWalletChange && state.value > 0)
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "${state.value} ${S.of(context).EGP}${S.of(context).CaptinwalletMsg2}",
                      style: AppStyles.styleMedium16(context)
                          .copyWith(color: Colors.green),
                    ),
                  ),
                const Spacer(),
                if (state is AddWalletLoading)
                  const Center(child: CircularProgressIndicator(color: pKcolor))
                else
                  CustomButton(
                    text: S.of(context).Submit,
                    txtcolor: Colors.white,
                    btncolor: pKcolor,
                    onPressed: () {
                      BlocProvider.of<AddWalletCubit>(context).add(context);
                    },
                  ),
                const Gap(24),
              ],
            );
          },
        ),
      ),
    );
  }
}
