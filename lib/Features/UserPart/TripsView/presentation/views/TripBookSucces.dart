import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/generated/l10n.dart';

class TripBookSucces extends StatefulWidget {
  const TripBookSucces({super.key});

  @override
  _TripBookSuccesState createState() => _TripBookSuccesState();
}

class _TripBookSuccesState extends State<TripBookSucces>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Success'),
      icon: ScaleTransition(
        scale: _animation,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: AssetImage(Assets.imagesSuccesIcon))),
          child: const Center(
            child: Icon(
              Icons.done,
              color: Colors.white,
              size: 50,
            ),
          ),
        ),
      ),
      content: Text(
        S.of(context).SuccessBook,
        style: AppStyles.styleMedium16(context).copyWith(color: blackdcolor),
      ),
      actions: [
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
