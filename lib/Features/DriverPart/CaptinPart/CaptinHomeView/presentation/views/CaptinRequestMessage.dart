import 'dart:async';

import 'package:flutter/material.dart';

class CaptinRequestMessage extends StatefulWidget {
  const CaptinRequestMessage({super.key});

  @override
  State<CaptinRequestMessage> createState() => _CaptinRequestMessageState();
}

class _CaptinRequestMessageState extends State<CaptinRequestMessage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();

    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          LinearProgressIndicator(
            value: _animation.value,
          ),
          const Text("Timed Message"),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('This dialog will disappear after 5 seconds.'),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
