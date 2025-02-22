import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/RoutesUtlis.dart';
import 'package:yallanow/Core/utlis/service_locator.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/Repo/AddressRepoImpl.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/CurrentLocationCubit/current_location_cubit_cubit.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/auto_complete_places_cubit/auto_complete_places_cubit.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/views/AddressTextField.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/views/SearchListTile.dart';
import 'package:yallanow/generated/l10n.dart';
import 'package:yallanow/Core/utlis/location_service.dart';

class AddressSearchSec extends StatefulWidget {
  const AddressSearchSec({
    super.key,
  });

  @override
  State<AddressSearchSec> createState() => _AddressSearchSecState();
}

class _AddressSearchSecState extends State<AddressSearchSec> {
  final List<PlaceModel> places = [];
  String description = '';
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CurrentLocationCubit(LocationService(), RoutesUtils())
                ..updateMyLocation(),
        ),
      ],
      child: BlocBuilder<AutoCompletePlacesCubit, AutoCompletePlacesState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const Gap(16),
                // CustomTextField(
                //   hintText: S.of(context).Search,
                //   onChanged: (value) {
                //     if (value.isNotEmpty) {
                //       BlocProvider.of<AutoCompletePlacesCubit>(context)
                //           .getPlaces(input: value);
                //       if (state is AutoCompletePlacesSucssess) {
                //         places.clear();
                //         places.addAll(state.places);
                //       }
                //     } else {
                //       places.clear();
                //       setState(() {});
                //     }
                //   },
                //   controller: textEditingController,
                // ),
                AddressTextField(
                  hintText: S.of(context).Search,
                  onFieldSubmitted: (value) {
                    context
                        .read<CurrentLocationCubit>()
                        .selectedLocation(description: value);
                  },
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      BlocProvider.of<AutoCompletePlacesCubit>(context)
                          .getPlaces(input: value);
                      if (state is AutoCompletePlacesSucssess) {
                        places.clear();
                        places.addAll(state.places);
                      }
                    } else {
                      places.clear();
                      setState(() {});
                    }
                  },
                  textEditingController: textEditingController,
                ),
                const SizedBox(height: 5),
                places.isNotEmpty
                    ? Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return SearchListTile(
                                  onTap: () async {
                                    await context
                                        .read<CurrentLocationCubit>()
                                        .selectedLocation(
                                            description:
                                                places[index].description!);
                                    textEditingController.text =
                                        places[index].description!;

                                    places.clear();
                                    setState(() {});
                                  },
                                  title: places[index].description!);
                            },
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                            itemCount: places.length),
                      )
                    : const SizedBox()
              ],
            ),
          );
        },
      ),
    );
  }
}
