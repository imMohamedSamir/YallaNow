import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/auto_complete_places_cubit/auto_complete_places_cubit.dart';

class SearchFieldsSec extends StatelessWidget {
  const SearchFieldsSec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AutoCompletePlacesCubit>(context)
        .setSourceTextController(context);
    return Column(
      children: [
        CustomTextField(
          controller: BlocProvider.of<AutoCompletePlacesCubit>(context)
              .sourceTextController,
          focusNode:
              BlocProvider.of<AutoCompletePlacesCubit>(context).sourceFocusNode,
          hintText: "Enter current place",
          prefixIcon: const Icon(Icons.my_location_rounded),
          onChanged: (value) {
            if (value.isNotEmpty) {
              BlocProvider.of<AutoCompletePlacesCubit>(context)
                  .getPlaces(input: value);
            } else {
              BlocProvider.of<AutoCompletePlacesCubit>(context).clearPlaces();
            }
          },
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: BlocProvider.of<AutoCompletePlacesCubit>(context)
              .distanceTextController,
          focusNode: BlocProvider.of<AutoCompletePlacesCubit>(context)
              .destinationFocusNode,
          hintText: "Where to?",
          prefixIcon: const Icon(Icons.location_on_outlined),
          onChanged: (value) {
            if (value.isNotEmpty) {
              BlocProvider.of<AutoCompletePlacesCubit>(context)
                  .getPlaces(input: value);
            } else {
              BlocProvider.of<AutoCompletePlacesCubit>(context).clearPlaces();
            }
          },
        ),
      ],
    );
  }
}
