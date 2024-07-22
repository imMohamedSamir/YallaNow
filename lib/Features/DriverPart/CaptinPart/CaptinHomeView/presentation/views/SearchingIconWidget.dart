import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';

class SearchingIconWidget extends StatefulWidget {
  const SearchingIconWidget({
    super.key,
  });

  @override
  State<SearchingIconWidget> createState() => _SearchingIconWidgetState();
}

class _SearchingIconWidgetState extends State<SearchingIconWidget>
    with TickerProviderStateMixin {
  late final GifController controller1;
  @override
  void initState() {
    controller1 = GifController(vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.getHeight(200, context),
      width: AppSizes.getWidth(200, context),
      child: Gif(
        controller: controller1,
        fps: 30,
        image: const AssetImage(Assets.imagesSearchingReqeust),
        onFetchCompleted: () {
          controller1.reset();
          controller1.forward();
        },
        height: double.infinity,
        fit: BoxFit.fill,
        autostart: Autostart.loop,
      ),
    );
  }
}
