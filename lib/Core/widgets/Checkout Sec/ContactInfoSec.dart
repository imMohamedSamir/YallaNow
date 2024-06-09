import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/place_order_cubit/place_order_cubit.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Features/UserPart/AddressesView/data/models/user_addresses_details_model/user_addresses_details_model.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/manager/home_address_cubit/home_address_cubit.dart';
import 'package:yallanow/Features/UserPart/homeView/presentation/views/LocationAppBar.dart';

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
      readonlyAddress = _addressController.text.isNotEmpty;
      _phoneController.text = addressData.contact?.contactPhone ?? '';
      readonlyPhone = _phoneController.text.isNotEmpty;
    });
  }

  void intializeAddress() {
    final state = BlocProvider.of<HomeAddressCubit>(context).state;
    if (state is HomeAddressChange) {
      UserAddressesDetailsModel addressData = state.address;
      addressId = addressData.id ?? '';
      _addressController.text = "${addressData.city}\n${addressData.street}";
      readonlyAddress = _addressController.text.isNotEmpty;
      _phoneController.text = addressData.contact?.contactPhone ?? '';
      readonlyPhone = _phoneController.text.isNotEmpty;
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
              Text("Contact Info", style: AppStyles.styleSemiBold16(context)),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _addressController,
                autovalidateMode: autovalidateModeAddress,
                prefixIcon: const Icon(
                  Icons.location_pin,
                  color: scColor,
                ),
                hintText: "Address",
                readOnly: readonlyAddress,
                suffixIcon: TextButton(
                    onPressed: () {
                      addressBottomSheet(context: context);
                    },
                    child: Text(
                      "Change",
                      style: AppStyles.styleMedium12(context)
                          .copyWith(color: const Color(0xffB20404)),
                    )),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your Address';
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
                readOnly: readonlyPhone,
                prefixIcon: const Icon(Icons.call, color: scColor),
                hintText: "Phone Number",
                keyboardType: TextInputType.number,
                suffixIcon: TextButton(
                  onPressed: () {
                    setState(() {
                      readonlyPhone = false;
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
                    return 'Please enter your mobile number';
                  }
                  if (value.length > 11 || value.length < 11) {
                    return 'Please enter correct mobile number ';
                  }
                  return null;
                },
                onChanged: (p0) {
                  autovalidateModePhone = AutovalidateMode.onUserInteraction;
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
          return SizedBox();
        }
      },
    );
  }
}
