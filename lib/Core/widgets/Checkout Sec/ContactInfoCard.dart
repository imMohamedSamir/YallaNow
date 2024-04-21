import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class ContactInfoCard extends StatefulWidget {
  const ContactInfoCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.height,
    required this.image,
    this.isordered = false,
  });
  final String title;
  final String? subtitle;
  final double height;
  final Widget image;
  final bool isordered;

  @override
  State<ContactInfoCard> createState() => _ContactInfoCardState();
}

class _ContactInfoCardState extends State<ContactInfoCard> {
  bool isChanged = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: widget.height,
        child: ListTile(
          shape: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff5A5A5A)),
              borderRadius: BorderRadius.circular(8)),
          titleAlignment: ListTileTitleAlignment.titleHeight,
          textColor: const Color(0xff5A5A5A),
          titleTextStyle: AppStyles.styleMedium16(context),
          title: widget.subtitle == null
              ? isChanged
                  ? const TextField(
                      decoration: InputDecoration(border: InputBorder.none))
                  : Text(widget.title)
              : Text(widget.title),
          subtitle: Text(
            widget.subtitle ?? "",
            style: AppStyles.styleRegular14(context)
                .copyWith(color: const Color(0xff5A5A5A)),
          ),
          ////////////////////////////////////
          leading: widget.image,
          ////////////////////////////////////
          trailing: widget.isordered
              ? const SizedBox()
              : Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        isChanged = true;
                      },
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
