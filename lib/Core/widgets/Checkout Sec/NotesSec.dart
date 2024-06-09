import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/place_order_cubit/place_order_cubit.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';

class NotesSec extends StatelessWidget {
  const NotesSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Notes",
                style: AppStyles.styleSemiBold16(context)
                    .copyWith(color: const Color(0xff240301))),
            const Spacer(),
            Container(
              width: AppSizes.getWidth(76, context),
              height: AppSizes.getHeight(23, context),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: ShapeDecoration(
                color: const Color(0xFFF5F5F5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text('Optional',
                  style: AppStyles.styleMedium10(context)
                      .copyWith(color: const Color(0xff5A5A5A))),
            ),
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
