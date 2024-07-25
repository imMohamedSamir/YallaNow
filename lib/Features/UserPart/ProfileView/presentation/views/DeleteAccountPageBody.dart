import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/utlis/functions/scaffoldMsgMethod.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/LoginView.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/manager/delete_account_cubit/delete_account_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

class DeleteAccountPageBody extends StatelessWidget {
  const DeleteAccountPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
        listener: (context, state) async {
          if (state is DeleteAccountFailure) {
            ScaffoldMsgMethod.showMsg(context,
                msg: state.errMsg, isError: true);
          }
          if (state is DeleteAccountSuccess) {
            ScaffoldMsgMethod.showMsg(context,
                msg: S.of(context).deletedSuccess);
            await Future.delayed(const Duration(seconds: 1));
            if (context.mounted) {
              NavigateToPage.slideFromTopAndRemove(
                  context: context, page: const LoginView());
            }
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).deleteAccQ,
                style: AppStyles.styleMedium16(context)
                    .copyWith(color: blackdcolor),
              ),
              const Gap(12),
              Text(
                S.of(context).deleteAccMsg,
                style:
                    AppStyles.styleMedium14(context).copyWith(color: pKcolor),
              ),
              const Gap(16),
              DeleteInclude(msg: S.of(context).deleteAccMsginclude1),
              const Gap(8),
              DeleteInclude(msg: S.of(context).deleteAccMsginclude2),
              const Spacer(),
              if (state is DeleteAccountLoading)
                const Center(child: CircularProgressIndicator(color: pKcolor))
              else
                CustomButton(
                  text: S.of(context).DeleteAcc,
                  txtcolor: Colors.white,
                  btncolor: pKcolor,
                  onPressed: () {
                    BlocProvider.of<DeleteAccountCubit>(context).delete();
                  },
                ),
              const Gap(16),
              Text(S.of(context).deleteAccMsg2,
                  style: AppStyles.styleMedium12(context)),
              const Gap(16)
            ],
          );
        },
      ),
    );
  }
}

class DeleteInclude extends StatelessWidget {
  const DeleteInclude({
    super.key,
    required this.msg,
  });
  final String msg;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.circle, color: Colors.black, size: 8),
        const Gap(8),
        Text(
          msg,
          style: AppStyles.styleRegular14(context).copyWith(color: scColor),
        )
      ],
    );
  }
}
