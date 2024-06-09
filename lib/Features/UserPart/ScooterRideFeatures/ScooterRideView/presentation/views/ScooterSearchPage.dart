import 'package:flutter/material.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/views/SearchResultSec.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/ScooterRideView/presentation/views/SearchFieldsSec.dart';

class ScooterSearchPage extends StatelessWidget {
  const ScooterSearchPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchFieldsSec(),
              SizedBox(height: 16),
              Divider(),
              SearchResultSec(),
            ],
          ),
        ),
      ),
    );
  }
}
