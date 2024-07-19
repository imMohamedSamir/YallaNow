import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/MainAppBar.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/generated/l10n.dart';

class RestPasswordWayPage extends StatelessWidget {
  const RestPasswordWayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondAppBar(context, title: S.of(context).ForgetPassword),
      body: const RestPasswordWayPageBody(),
    );
  }
}

class RestPasswordWayPageBody extends StatelessWidget {
  const RestPasswordWayPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(
        children: [
          const Gap(16),
          Text(S.of(context).chooseRestWay,
              style: AppStyles.styleMedium18(context)),
          const Gap(16),
          const ResetPasswordMethodWidget()
        ],
      ),
    );
  }
}

class ResetPasswordMethodWidget extends StatefulWidget {
  const ResetPasswordMethodWidget({super.key});

  @override
  ResetPasswordMethodWidgetState createState() =>
      ResetPasswordMethodWidgetState();
}

class ResetPasswordMethodWidgetState extends State<ResetPasswordMethodWidget> {
  int _selectedMethod = 0;
  String phoneNumber = '01127523369';
  @override
  void initState() {
    _selectedMethod = 0;
    phoneNumber = phoneNumber.substring(phoneNumber.length - 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          activeColor: pKcolor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).ResetviaPhone,
                  style: AppStyles.styleRegular16(context)),
              const Gap(8),
              Text("*** *** *** $phoneNumber",
                  style: AppStyles.styleRegular14(context)
                      .copyWith(color: scColor))
            ],
          ),
          value: 0,
          groupValue: _selectedMethod,
          onChanged: (value) {
            setState(() {
              _selectedMethod = value!;
            });
          },
        ),
        // RadioListTile(
        //   activeColor: pKcolor,
        //   title: Column(
        //     children: [
        //       Text('Reset via Phone'),
        //     ],
        //   ),
        //   value: 1,
        //   groupValue: _selectedMethod,
        //   onChanged: (value) {
        //     setState(() {
        //       _selectedMethod = value!;
        //     });
        //   },
        // ),
        const Gap(60),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomButton(
            text: S.of(context).Next,
            txtcolor: Colors.white,
            btncolor: pKcolor,
            onPressed: () {},
          ),
        ),
        const Gap(16)
      ],
    );
  }
}
