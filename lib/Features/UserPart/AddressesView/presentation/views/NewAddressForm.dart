import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/UserInputAddressModel.dart';
import 'package:yallanow/Features/UserPart/AddressesView/presentation/views/SaveAddressButtonBuilder.dart';

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
  bool change1 = true;
  bool change2 = true;
  String deliveryNotes = '';
  final _formKey = GlobalKey<FormState>();
  var location;
  UserInputAddressModel userAddress = UserInputAddressModel();

  @override
  void initState() {
    userAddress.latitude = widget.position.latitude;
    userAddress.longitude = widget.position.longitude;
    location = widget.locationDetails;
    userAddress.postalCode = location.postalCode;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        CustomTextField(
          hintText: "Address",
          maxLines: 2,
          prefixIcon: const Icon(Icons.location_pin),
          initialValue:
              '${location.administrativeArea} - ${location.subAdministrativeArea} - ${location.subThoroughfare}  \n ${location.locality} -${location.postalCode}',
          readOnly: change1,
          suffixIcon: MaterialButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                change1 = false;
              });
            },
            child: Text(
              "Change",
              style: AppStyles.styleMedium12(context)
                  .copyWith(color: const Color(0xffB20404)),
            ),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "Enter your Adderss";
            }
            return null;
          },
          onSaved: (value) {
            userAddress.country = location.country;
            userAddress.state = location.administrativeArea;
            userAddress.city = location.subAdministrativeArea;
          },
        ),
        const SizedBox(height: 16),
        CustomTextField(
          hintText: "phone number",
          prefixIcon: const Icon(Icons.call),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter your mobile number';
            }
            if (value.length > 11 || value.length < 11) {
              return 'Please enter correct mobile number ';
            }
            return null;
          },
          onSaved: (value) {
            userAddress.contactPhone = value!.trim();
            userAddress.extraContactPhone = value.trim();
          },
        ),
        const SizedBox(height: 16),
        CustomTextField(
          hintText: "Address name (EX: Work)",
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "Enter your Address Label";
            }
            return null;
          },
          onSaved: (value) {
            userAddress.label = value?.trim();
          },
        ),
        const SizedBox(height: 16),
        CustomTextField(
          hintText: "street name",
          initialValue:
              "${location.thoroughfare} - ${location.subThoroughfare}",
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "Enter your street name";
            }
            return null;
          },
          onSaved: (value) {
            userAddress.street = value!.trim();
          },
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                hintText: "Building num",
                initialValue: location.street,
                onSaved: (value) {
                  log(deliveryNotes.isEmpty.toString());
                  if (deliveryNotes.isEmpty) {
                    deliveryNotes = value!.trim();
                    userAddress.deliveryNotes = deliveryNotes;
                  } else {
                    deliveryNotes += " - ${value!.trim()}";
                    userAddress.deliveryNotes = deliveryNotes;
                  }
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
                child: CustomTextField(
              hintText: "Floor num *",
              onSaved: (value) {
                if (deliveryNotes.isEmpty) {
                  deliveryNotes = value!.trim();
                  userAddress.deliveryNotes = deliveryNotes;
                } else {
                  deliveryNotes += " - ${value!.trim()}";
                  userAddress.deliveryNotes = deliveryNotes;
                }
              },
            ))
          ],
        ),
        const SizedBox(height: 16),
        CustomTextField(
          hintText: "Addition details *",
          onSaved: (value) {
            if (deliveryNotes.isEmpty) {
              deliveryNotes = value!.trim();
              userAddress.deliveryNotes = deliveryNotes;
            } else {
              deliveryNotes += " - ${value!.trim()}";
              userAddress.deliveryNotes = deliveryNotes;
            }
          },
        ),
        SizedBox(height: AppSizes.getHeight(100, context)),
        SaveAddressButtonBuilder(
          userAddress: userAddress,
          formKey: _formKey,
        ),
        const SizedBox(height: 16),
      ]),
    );
  }
}
