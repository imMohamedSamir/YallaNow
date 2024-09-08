import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Features/UserPart/BasketView/presentation/manager/basket_manager_cubit/basket_manager_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

class BasketNoteSec extends StatelessWidget {
  const BasketNoteSec({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Row(
          children: [
            Text(S.of(context).OrderNotes,
                style: AppStyles.styleMedium16(context)),
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
              child: Text(S.of(context).Optional,
                  style: AppStyles.styleMedium10(context)
                      .copyWith(color: const Color(0xff5A5A5A))),
            )
          ],
        ),
        const Gap(8),
        CustomTextField(
          hintText: S.of(context).OrderNotesHint,
          onChanged: (value) {
            BlocProvider.of<BasketManagerCubit>(context).orederNotes =
                value.trim();
          },
        ),
      ],
    );
  }
}
