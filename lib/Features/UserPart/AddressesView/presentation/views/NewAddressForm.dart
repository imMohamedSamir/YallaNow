import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/manager/add_user_address_cubit/add_user_address_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

class NewAddressForm extends StatefulWidget {
  const NewAddressForm({
    super.key,
    required this.locationDetails,
    required this.position,
  });
  final Placemark locationDetails;
  final LatLng position;

  @override
  State<NewAddressForm> createState() => _NewAddressFormState();
}

class _NewAddressFormState extends State<NewAddressForm> {
  bool change1 = false;
  bool change2 = true;
  String deliveryNotes = '';
  var location;
  late AddUserAddressCubit _cubit;
  AutovalidateMode phoneValidate = AutovalidateMode.disabled;

  @override
  void initState() {
    _cubit = BlocProvider.of<AddUserAddressCubit>(context);
    _cubit.newaddress.latitude = widget.position.latitude;
    _cubit.newaddress.longitude = widget.position.longitude;
    location = widget.locationDetails;
    _cubit.newaddress.postalCode = location.postalCode;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<AddUserAddressCubit>(context).formKey,
      child: Column(children: [
        const Gap(16),
        CustomTextField(
          label: S.of(context).address,
          maxLines: 2,
          prefixIcon: const Icon(Icons.location_pin),
          initialValue:
              '${location.administrativeArea} - ${location.subAdministrativeArea} - ${location.subThoroughfare}  \n ${location.locality} -${location.postalCode}',
          enabled: change1,
          suffixIcon: MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                change1 = true;
              });
            },
            child: Text(
              S.of(context).change,
              style: AppStyles.styleMedium12(context).copyWith(color: pKcolor),
            ),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return S.of(context).addressValidation;
            }
            return null;
          },
          onSaved: (value) {
            _cubit.newaddress.country = location.country;
            _cubit.newaddress.state = location.administrativeArea;
            _cubit.newaddress.city = location.subAdministrativeArea;
          },
        ),
        const SizedBox(height: 16),
        CustomTextField(
          hintText: S.of(context).PhoneNumber,
          autovalidateMode: phoneValidate,
          prefixIcon: const Icon(Icons.call),
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
              phoneValidate = AutovalidateMode.onUserInteraction;
            });
          },
          onSaved: (value) {
            _cubit.newaddress.contactPhone = value!.trim();
            _cubit.newaddress.extraContactPhone = value.trim();
          },
        ),
        const SizedBox(height: 16),
        CustomTextField(
          hintText: S.of(context).AddressType,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return S.of(context).AddressTypeValidation;
            }
            return null;
          },
          onSaved: (value) {
            _cubit.newaddress.label = value?.trim();
          },
        ),
        const SizedBox(height: 16),
        CustomTextField(
          hintText: S.of(context).StreetName,
          initialValue: location.street,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return S.of(context).StreetNameValidation;
            }
            return null;
          },
          onSaved: (value) {
            _cubit.newaddress.street = value!.trim();
          },
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                hintText: S.of(context).BuildingNum,
                onSaved: (value) {
                  if (deliveryNotes.isEmpty) {
                    deliveryNotes = value!.trim();
                    _cubit.newaddress.deliveryNotes = deliveryNotes;
                  } else {
                    deliveryNotes += " - ${value!.trim()}";
                    _cubit.newaddress.deliveryNotes = deliveryNotes;
                  }
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
                child: CustomTextField(
              hintText: S.of(context).FloorNum,
              onSaved: (value) {
                if (deliveryNotes.isEmpty) {
                  deliveryNotes = value!.trim();
                  _cubit.newaddress.deliveryNotes = deliveryNotes;
                } else {
                  deliveryNotes += " - ${value!.trim()}";
                  _cubit.newaddress.deliveryNotes = deliveryNotes;
                }
              },
            ))
          ],
        ),
        const SizedBox(height: 16),
        CustomTextField(
          hintText: S.of(context).AdditionDetails,
          onSaved: (value) {
            if (deliveryNotes.isEmpty) {
              deliveryNotes = value!.trim();
              _cubit.newaddress.deliveryNotes = deliveryNotes;
            } else {
              deliveryNotes += " - ${value!.trim()}";
              _cubit.newaddress.deliveryNotes = deliveryNotes;
            }
          },
        ),
      ]),
    );
  }
}
