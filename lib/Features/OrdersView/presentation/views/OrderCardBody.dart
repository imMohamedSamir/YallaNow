import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class OrderCardBody extends StatelessWidget {
  const OrderCardBody({
    super.key,
    required this.title,
    required this.price,
    required this.id,
    required this.img,
  });
  final String title, price, id, img;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.titleHeight,
      contentPadding: EdgeInsets.zero,
      subtitleTextStyle: AppStyles.styleRegular14(context)
          .copyWith(color: const Color(0xff5A5A5A)),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          img,
          height: AppSizes.getHeight(60, context),
          width: AppSizes.getWidth(60, context),
          fit: BoxFit.fill,
        ),
      ),
      title: Text(title, style: AppStyles.styleSemiBold20(context)),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 6),
        Text("$price EGB"),
        Text("ID: $id")
      ]),
    );
  }
}
