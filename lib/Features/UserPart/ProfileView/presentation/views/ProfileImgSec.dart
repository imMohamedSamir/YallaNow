import 'package:flutter/widgets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';

class ProfileImgSec extends StatelessWidget {
  const ProfileImgSec({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.getWidth(120, context),
      height: AppSizes.getHeight(120, context),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            // width: AppSizes.getWidth(120, context),
            // height: AppSizes.getHeight(120, context),
            decoration: BoxDecoration(
                color: const Color(0xffFCD19C).withOpacity(0.9),
                shape: BoxShape.circle),
            child: Center(
              child: Text(
                name.characters.first,
                style:
                    AppStyles.styleSemiBold20(context).copyWith(fontSize: 60),
              ),
            ),
          ),
          // const ProfileEditIcon()
        ],
      ),
    );
  }
}
