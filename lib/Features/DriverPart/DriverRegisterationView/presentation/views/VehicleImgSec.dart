import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/views/VehicleImgBuilder.dart';
import 'package:yallanow/generated/l10n.dart';

class VehicleImgSec extends StatelessWidget {
  const VehicleImgSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(S.of(context).VehicleImages,
                style: AppStyles.styleMedium16(context)),
            const Gap(8),
            IconButton(
                onPressed: () {
                  _showInfo(context);
                },
                icon: const Icon(Icons.info_outline))
          ],
        ),
        const VehicleImgBuilder(),
      ],
    );
  }

  void _showInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          title: Text(S.of(context).imageDirections),
          content: const VehicleImgInfo()),
    );
  }
}

class VehicleImgInfo extends StatelessWidget {
  const VehicleImgInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(260, context),
      child: Column(
        children: [
          _buildImageRow(context, Assets.imagesDic1, Assets.imagesDic2),
          const Gap(16),
          _buildImageRow(context, Assets.imagesDic3, Assets.imagesDic4),
        ],
      ),
    );
  }

  Widget _buildImageRow(
      BuildContext context, String imagePath1, String imagePath2) {
    return Row(
      children: [
        _buildImage(context, imagePath1),
        const Gap(8),
        _buildImage(context, imagePath2),
      ],
    );
  }

  Widget _buildImage(BuildContext context, String imagePath) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1.09,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
