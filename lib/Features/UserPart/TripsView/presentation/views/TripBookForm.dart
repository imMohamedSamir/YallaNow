import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/manager/trip_book_cubit/trip_book_cubit.dart';
import 'package:yallanow/Features/UserPart/TripsView/presentation/views/TripFormBtnBuilder.dart';
import 'package:yallanow/generated/l10n.dart';

class TripBookForm extends StatefulWidget {
  const TripBookForm({super.key});

  @override
  State<TripBookForm> createState() => _TripBookFormState();
}

class _TripBookFormState extends State<TripBookForm> {
  late GlobalKey<FormState> _formKey;
  TripBookCubit? cubit;
  // Variables to hold the values of the fields
  AutovalidateMode autovalidateModePhoneNumber = AutovalidateMode.disabled;
  @override
  void initState() {
    _formKey = BlocProvider.of<TripBookCubit>(context).formKey;
    cubit = BlocProvider.of<TripBookCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            hintText: S.of(context).TravellerName,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).NameValidation;
              }
              return null;
            },
            onSaved: (value) {
              cubit!.bookModel.name = value?.trim();
            },
          ),
          const Gap(16),
          CustomTextField(
            hintText: S.of(context).PhoneNumber,
            autovalidateMode: autovalidateModePhoneNumber,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).PhoneValidation;
              }
              if (value.length > 11 || value.length < 11) {
                return S.of(context).correctPhoneNumber;
              }
              return null;
            },
            onChanged: (p0) {
              setState(() {
                autovalidateModePhoneNumber =
                    AutovalidateMode.onUserInteraction;
              });
            },
            onSaved: (value) {
              cubit!.bookModel.phoneNumber = value?.trim();
            },
          ),
          const Gap(16),
          CustomTextField(
            hintText: S.of(context).Email,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).MailValidation;
              }
              if (!value.contains("@")) {
                return S.of(context).correctEmail;
              }
              return null;
            },
            onSaved: (value) {
              cubit!.bookModel.email = value?.trim();
            },
          ),
          const Gap(16),
          CustomTextField(
            hintText: S.of(context).Nationality,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).NationalityValidation;
              }
              return null;
            },
            onSaved: (value) {
              cubit!.bookModel.nationality = value?.trim();
            },
          ),
          const Gap(16),
          CustomTextField(
            hintText: S.of(context).Location,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).LocationValidation;
              }
              return null;
            },
            onSaved: (value) {
              cubit!.bookModel.location = value?.trim();
            },
          ),
          const Gap(16),
          CustomTextField(
            hintText: S.of(context).Hotel,
            textInputAction: TextInputAction.next,
            onSaved: (value) {
              cubit!.bookModel.hotel = value?.trim();
            },
          ),
          const Gap(16),
          CustomTextField(
            hintText: S.of(context).Room,
            textInputAction: TextInputAction.next,
            onSaved: (value) {
              cubit!.bookModel.hotelRoom = value?.trim();
            },
          ),
          const Gap(16),
          CustomTextField(
            hintText: S.of(context).Numberofadult,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return S.of(context).adultValidation;
              }
              return null;
            },
            onSaved: (value) {
              cubit!.bookModel.numberOfAdults =
                  int.tryParse(value?.trim() ?? '');
            },
          ),
          const Gap(16),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  hintText: S.of(context).NumberofKids,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onSaved: (value) {
                    cubit!.bookModel.numberOfKids =
                        int.tryParse(value?.trim() ?? '0') ?? 0;
                  },
                ),
              ),
              const Gap(16),
              Expanded(
                child: CustomTextField(
                  hintText: S.of(context).NumberofJuniors,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  onSaved: (value) {
                    cubit!.bookModel.numberofjouniors =
                        int.tryParse(value?.trim() ?? '0') ?? 0;
                  },
                ),
              ),
            ],
          ),
          const Gap(16),
          TripFormBtnBuilder(fromkey: _formKey)
        ],
      ),
    );
  }
}
