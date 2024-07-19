import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/Methods/HashMail.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/password_reset_request_cubit/password_reset_request_cubit.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/manager/verify_otp_cubit/verify_otp_cubit.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/AuthQ.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/OTP_TextField.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/verifyHeader.dart';
import 'package:yallanow/generated/l10n.dart';

class ForgetPasswordVerifyBody extends StatelessWidget {
  const ForgetPasswordVerifyBody({
    super.key,
    required this.email,
  });

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          AuthHeader(
              firstHeader: S.of(context).ForgetPassword,
              secondHeader:
                  "${S.of(context).CodeSentMsg} ${hashEmail(email!)}"),
          const SizedBox(height: 40),
          OTPTextField(email: email),
          const SizedBox(height: 20),
          AuthQ(
              onTap: () {
                BlocProvider.of<VerifyOtpCubit>(context).setInitial();
                BlocProvider.of<PasswordResetRequestCubit>(context)
                    .send(email: email!);
              },
              firstText: S.of(context).DidntReciveCode,
              secondText: S.of(context).resendAgain),
        ],
      ),
    );
  }
}
