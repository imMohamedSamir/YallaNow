import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/place_order_cubit/place_order_cubit.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/user_addresses_details_model/user_addresses_details_model.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/home_address_cubit/home_address_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/LocationAppBar.dart';
import 'package:yallanow/generated/l10n.dart';

class ContactInfoSec extends StatefulWidget {
  const ContactInfoSec({super.key});

  @override
  State<ContactInfoSec> createState() => _ContactInfoSecState();
}

class _ContactInfoSecState extends State<ContactInfoSec> {
  String address = '';
  String phone = '';
  String addressId = '';
  bool readonlyAddress = true;
  bool readonlyPhone = true;
  late TextEditingController _addressController;
  late TextEditingController _phoneController;
  @override
  void initState() {
    _addressController = TextEditingController();
    _phoneController = TextEditingController();
    intializeAddress();
    super.initState();
  }

  void getAddress(UserAddressesDetailsModel addressData) {
    setState(() {
      addressId = addressData.id ?? '';
      _addressController.text = "${addressData.city}\n${addressData.street}";
      readonlyAddress = _addressController.text.isEmpty;
      _phoneController.text = addressData.contact?.contactPhone ?? '';
      readonlyPhone = _phoneController.text.isEmpty;
    });
  }

  void intializeAddress() {
    final state = BlocProvider.of<HomeAddressCubit>(context).state;
    if (state is HomeAddressChange) {
      UserAddressesDetailsModel addressData = state.address;
      addressId = addressData.id ?? '';
      _addressController.text = "${addressData.city}\n${addressData.street}";
      readonlyAddress = _addressController.text.isEmpty;
      _phoneController.text = addressData.contact?.contactPhone ?? '';
      readonlyPhone = _phoneController.text.isEmpty;
    }
  }

  @override
  void dispose() {
    _addressController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  AutovalidateMode autovalidateModeAddress = AutovalidateMode.disabled;
  AutovalidateMode autovalidateModePhone = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeAddressCubit, HomeAddressState>(
      listener: (context, state) {
        if (state is HomeAddressChange) {
          getAddress(state.address);
        }
      },
      builder: (context, state) {
        if (state is HomeAddressChange) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(S.of(context).ContactInfo,
                      style: AppStyles.styleSemiBold16(context)),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        addressBottomSheet(context: context);
                        setState(() {
                          readonlyPhone = true;
                        });
                      },
                      child: Text(
                        S.of(context).change,
                        style: AppStyles.styleMedium14(context)
                            .copyWith(color: pKcolor),
                      ))
                ],
              ),
              CustomTextField(
                controller: _addressController,
                autovalidateMode: autovalidateModeAddress,
                prefixIcon: const Icon(Icons.location_pin, color: scColor),
                hintText: S.of(context).address,
                enabled: readonlyAddress,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return S.of(context).addressValidation;
                  }
                  return null;
                },
                onChanged: (p0) {
                  autovalidateModeAddress = AutovalidateMode.onUserInteraction;
                },
                onSaved: (value) {
                  BlocProvider.of<PlaceOrderCubit>(context)
                      .checkoutdetails
                      .addressid = addressId;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _phoneController,
                autovalidateMode: autovalidateModePhone,
                enabled: readonlyPhone,
                prefixIcon: const Icon(Icons.call, color: scColor),
                hintText: S.of(context).PhoneNumber,
                keyboardType: TextInputType.number,
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
                    autovalidateModePhone = AutovalidateMode.onUserInteraction;
                  });
                },
                onSaved: (value) {
                  BlocProvider.of<PlaceOrderCubit>(context)
                      .checkoutdetails
                      .phonenumber = value!.trim();
                },
              ),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
