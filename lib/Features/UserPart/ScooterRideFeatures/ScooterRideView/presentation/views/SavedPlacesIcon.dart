import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class SavedPlacesIcon extends StatefulWidget {
  const SavedPlacesIcon({
    super.key,
    this.onPressed,
    required this.savedPlacesIconModel,
  });
  final SavedPlacesIconModel savedPlacesIconModel;

  final void Function()? onPressed;

  @override
  State<SavedPlacesIcon> createState() => _SavedPlacesIconState();
}

class _SavedPlacesIconState extends State<SavedPlacesIcon> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        setState(() {
          isActive = !isActive;
        });
      },
      child: Row(
        children: [
          Icon(
            widget.savedPlacesIconModel.iconData,
            color: isActive ? const Color(0xffB20404) : const Color(0xff5A5A5A),
          ),
          const SizedBox(width: 10),
          Text(widget.savedPlacesIconModel.place,
              style: AppStyles.styleMedium16(context).copyWith(
                  color: isActive
                      ? const Color(0xffB20404)
                      : const Color(0xff5A5A5A)))
        ],
      ),
    );
  }
}

class SavedPlacesIconModel {
  final String place;
  final IconData iconData;

  SavedPlacesIconModel({required this.place, required this.iconData});
}
