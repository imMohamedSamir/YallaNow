import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/place_order_cubit/place_order_cubit.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Core/widgets/OptionalCustomWidget.dart';
import 'package:yallanow/generated/l10n.dart';

class NotesSec extends StatelessWidget {
  const NotesSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(S.of(context).Notes,
                style: AppStyles.styleSemiBold16(context)
                    .copyWith(color: const Color(0xff240301))),
            const Spacer(),
            const OptionalCustomWidget(),
          ],
        ),
        const SizedBox(height: 16),
        CustomTextField(
          hintText: "Add notes",
          onSaved: (value) {
            BlocProvider.of<PlaceOrderCubit>(context)
                .checkoutdetails
                .orderNotes = value ?? "thank you";
          },
        )
      ],
    );
  }
}
