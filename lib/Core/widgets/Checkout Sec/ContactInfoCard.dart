import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class ContactInfoCard extends StatelessWidget {
  const ContactInfoCard({
    super.key,
    required this.title,
    this.subtitle,
    this.onTap,
    required this.height,
    required this.image,
  });
  final String title;
  final String? subtitle;
  final void Function()? onTap;
  final double height;
  final Widget image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: height,
        child: ListTile(
          shape: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff5A5A5A)),
              borderRadius: BorderRadius.circular(8)),
          titleAlignment: ListTileTitleAlignment.titleHeight,
          textColor: const Color(0xff5A5A5A),
          titleTextStyle: AppStyles.styleMedium16(context),
          title: subtitle == null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [const SizedBox(height: 7), Text(title)])
              : Text(title),
          subtitle: Text(
            subtitle ?? "",
            style: AppStyles.styleRegular14(context)
                .copyWith(color: const Color(0xff5A5A5A)),
          ),
          ////////////////////////////////////
          leading: image,
          ////////////////////////////////////
          trailing: Column(
            children: [
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "Change",
                  style: AppStyles.styleMedium12(context)
                      .copyWith(color: const Color(0xffB20404)),
                ),
              ),
            ],
          ),
        ));
  }
}
