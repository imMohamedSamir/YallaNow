import 'package:flutter/material.dart';

class LandScapeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: AlwaysStoppedAnimation(
                  0.25), // Rotate the child by 45 degrees
              child: Icon(
                Icons.screen_rotation,
                size: 50,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Please switch to portrait mode to continue.',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
