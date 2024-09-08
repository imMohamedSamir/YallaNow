import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppLang.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/generated/l10n.dart';

class OptionalCustomWidget extends StatelessWidget {
  const OptionalCustomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.getWidth(76, context),
      height: AppSizes.getHeight(23, context),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: ShapeDecoration(
        color: const Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Center(
        child: Text(S.of(context).Optional,
            style: AppLang.isArabic()
                ? AppStyles.styleMedium12(context)
                    .copyWith(color: const Color(0xff5A5A5A))
                : AppStyles.styleMedium10(context)
                    .copyWith(color: const Color(0xff5A5A5A))),
      ),
    );
  }
}
