import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Core/utlis/functions/scaffoldMsgMethod.dart';
import 'package:yallanow/Core/widgets/CustomTextField.dart';
import 'package:yallanow/Core/widgets/customButton.dart';
import 'package:yallanow/Features/UserPart/AuthView/presentation/views/widgets/GenderDropMenu.dart';
import 'package:yallanow/Features/UserPart/ProfileView/data/models/user_profile_details.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/manager/edit_user_details_cubit/edit_user_details_cubit.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/DeleteAccountPage.dart';
import 'package:yallanow/generated/l10n.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({
    super.key,
    required this.userProfileDetails,
  });
  final UserProfileDetails userProfileDetails;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<EditUserDetailsCubit>(context);
    bool enabeld = false;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Form(
        key: cubit.key,
        child: BlocConsumer<EditUserDetailsCubit, EditUserDetailsState>(
          listener: (context, state) {
            if (state is EditUserDetailsSuccess) {
              ScaffoldMsgMethod.showMsg(context,
                  msg: S.of(context).editSuccess);
            } else if (state is EditUserDetailsFailure) {
              ScaffoldMsgMethod.showMsg(context,
                  msg: state.errMsg, isError: true);
            }
          },
          builder: (context, state) {
            if (state is EditUserDetailsEnabeled) {
              enabeld = true;
            }
            return Column(
              children: [
                CustomTextField(
                  enabled: enabeld,
                  label: S.of(context).FirstName,
                  initialValue: "${userProfileDetails.firstName}",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return S.of(context).firstnameValidation;
                    }
                    return null;
                  },
                  onSaved: (value) {
                    cubit.userdetails.firstName = value!.trim();
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  enabled: enabeld,
                  label: S.of(context).LastName,
                  initialValue: "${userProfileDetails.lastName}",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return S.of(context).firstnameValidation;
                    }
                    return null;
                  },
                  onSaved: (value) {
                    cubit.userdetails.lastName = value!.trim();
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  enabled: false,
                  label: S.of(context).Email,
                  initialValue: "${userProfileDetails.email}",
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
                    cubit.userdetails.email = value!.trim();
                  },
                ),
                const SizedBox(height: 16),
                Genderdropmenu(
                  enabled: enabeld,
                  initialvalue: "Male",
                  onChanged: (value) {
                    cubit.userdetails.gender = value!.trim();
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return S.of(context).GenderValidation;
                    }
                    return null;
                  },
                  onSaved: (value) {
                    cubit.userdetails.gender = value!.trim();
                  },
                ),
                const SizedBox(height: 16),
                // const CustomTextField(hintText: "", initialValue: "Address"),
                // const SizedBox(height: 16),
                CustomTextField(
                  enabled: enabeld,
                  keyboardType: TextInputType.number,
                  label: S.of(context).PhoneNumber,
                  initialValue: "${userProfileDetails.phoneNumber}",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return S.of(context).PhoneValidation;
                    }
                    if (value.length < 11) {
                      return S.of(context).correctPhoneNumber;
                    }
                    return null;
                  },
                  onSaved: (value) {
                    cubit.userdetails.phoneNumber = value!.trim();
                  },
                ),
                SizedBox(height: AppSizes.getHeight(65, context)),
                if (enabeld)
                  const EditBtnBuilder()
                else
                  CustomButton(
                    text: S.of(context).DeleteAcc,
                    txtcolor: pKcolor,
                    btncolor: Colors.transparent,
                    isBasket: true,
                    onPressed: () {
                      NavigateToPage.slideFromRight(
                          context: context, page: const DeleteAccountPage());
                    },
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class EditBtnBuilder extends StatelessWidget {
  const EditBtnBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: S.of(context).Save,
      txtcolor: Colors.white,
      btncolor: pKcolor,
      onPressed: () {
        BlocProvider.of<EditUserDetailsCubit>(context).edit();
      },
    );
  }
}
