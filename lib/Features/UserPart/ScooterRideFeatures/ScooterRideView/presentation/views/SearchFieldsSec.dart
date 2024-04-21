import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/auto_complete_places_cubit/auto_complete_places_cubit.dart';

class SearchFieldsSec extends StatelessWidget {
  const SearchFieldsSec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: BlocProvider.of<AutoCompletePlacesCubit>(context)
              .textEditingController,
          hintText: "enter current place",
          prefixIcon: Icon(Icons.my_location_rounded),
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
        // CustomTextField(
        //   hintText: "Where to?",
        //   prefixIcon: Icon(Icons.location_on_outlined),
        //   controller: textEditingController, // Reuse the same controller
        //   onChanged: (value) {
        //     // Handle text field changes if needed
        //   },
        // ),
      ],
    );
  }
}
