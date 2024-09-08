import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/generated/l10n.dart';

class DeliveryPhaseSec extends StatefulWidget {
  const DeliveryPhaseSec({super.key});
  @override
  State<DeliveryPhaseSec> createState() => _DeliveryPhaseSecState();
}

class _DeliveryPhaseSecState extends State<DeliveryPhaseSec> {
  int carretnIndex = 0;

  final Color activeColor = const Color(0xffB20404);

  final Color unactiveColor = const Color(0xff9E9D9D);
  @override
  void initState() {
    // startDelayedProcess();
    super.initState();
  }

  void startDelayedProcess() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      if (carretnIndex < 3) {
        carretnIndex++;
        (startDelayedProcess());
      } else if (carretnIndex == 3) {
        carretnIndex++;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Color> stepTextColors = [
      carretnIndex >= 0 ? activeColor : unactiveColor,
      carretnIndex >= 1 ? activeColor : unactiveColor,
      carretnIndex >= 2 ? activeColor : unactiveColor,
      carretnIndex >= 3 ? activeColor : unactiveColor,
    ];
    return EasyStepper(
      loadingAnimation: "assets/Indicators/Loading.json",
      stepAnimationCurve: Curves.bounceInOut,
      internalPadding: 28,
      padding: EdgeInsets.zero,
      finishedStepTextColor: activeColor,
      finishedStepBackgroundColor: activeColor,
      unreachedStepBackgroundColor: unactiveColor,
      unreachedStepIconColor: unactiveColor,
      activeStepBorderColor: activeColor,
      showStepBorder: false,
      stepRadius: AppSizes.getHeight(16, context),
      lineStyle: LineStyle(
        lineType: LineType.normal,
        lineThickness: 1.7,
        defaultLineColor: pKcolor,
        finishedLineColor: activeColor,
        unreachedLineColor: unactiveColor,
      ),
      activeStep: carretnIndex,
      steps: [
        EasyStep(
          customTitle: Text(
            S.of(context).Placed,
            textAlign: TextAlign.center,
            style: AppStyles.styleMedium14(context)
                .copyWith(color: stepTextColors[0]), // Customize as needed
          ),
          icon: const Icon(Icons.done_rounded, size: 24),
        ),
        EasyStep(
          customTitle: Text(
            S.of(context).Preparing,
            textAlign: TextAlign.center,
            style: AppStyles.styleMedium14(context)
                .copyWith(color: stepTextColors[1]), // Customize as needed
          ),
          icon: const Icon(Icons.done_rounded, size: 20),
        ),
        EasyStep(
          customTitle: Text(
            S.of(context).Pickup,
            textAlign: TextAlign.center,
            style: AppStyles.styleMedium14(context)
                .copyWith(color: stepTextColors[2]), // Customize as needed
          ),
          icon: const Icon(Icons.done_rounded, size: 20),
        ),
        EasyStep(
          customTitle: Text(
            S.of(context).Delivered,
            textAlign: TextAlign.center,
            style: AppStyles.styleMedium14(context)
                .copyWith(color: stepTextColors[3]), // Customize as needed
          ),
          icon: const Icon(Icons.done_rounded, size: 24),
        ),
      ],
    );
  }
}
