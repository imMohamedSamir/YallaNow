import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/manager/driver_registeration_cubit/driver_registeration_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

enum RiderRole { delivery, captin }

class RiderRoleRadio extends StatelessWidget {
  const RiderRoleRadio(
      {super.key,
      this.value,
      this.groupValue,
      this.onChanged,
      required this.title,
      required this.icon});
  final value, groupValue;
  final void Function(dynamic)? onChanged;
  final String title, icon;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: AppSizes.getHeight(30, context),
        child: RadioListTile(
            activeColor: pKcolor,
            contentPadding: EdgeInsets.zero,
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppStyles.styleMedium16(context)),
                const SizedBox(width: 6),
                Image.asset(icon,
                    height: AppSizes.getHeight(18, context),
                    width: AppSizes.getWidth(18, context),
                    fit: BoxFit.fill),
              ],
            )),
      ),
    );
  }
}

class RiderRoleSec extends StatefulWidget {
  const RiderRoleSec({super.key});

  @override
  State<RiderRoleSec> createState() => _RiderRoleSecState();
}

class _RiderRoleSecState extends State<RiderRoleSec> {
  RiderRole? selectedRole;
  bool? type;
  DriverRegisterationCubit? cubit;
  @override
  void initState() {
    cubit = BlocProvider.of<DriverRegisterationCubit>(context);
    super.initState();
  }

  void chooseRole(RiderRole role, {required FormFieldState<RiderRole> state}) {
    setState(() {
      state.didChange(role);
      selectedRole = role;
      if (role.name == "delivery") {
        type = false;
      } else {
        type = true;
      }
      cubit!.driverRegisterModel.driverType = type;
    });
  }

  String? _validateRoles(RiderRole? role) {
    if (selectedRole == null) {
      return S.of(context).selectroleValidation;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: _validateRoles,
      builder: (FormFieldState<RiderRole> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                RiderRoleRadio(
                  title: S.of(context).AsDelivery,
                  icon: Assets.imagesRiderIcon,
                  value: RiderRole.delivery,
                  groupValue: selectedRole,
                  onChanged: (role) => chooseRole(role, state: state),
                ),
                RiderRoleRadio(
                  title: S.of(context).AsCaptin,
                  icon: Assets.imagesRiderIcon,
                  value: RiderRole.captin,
                  groupValue: selectedRole,
                  onChanged: (role) => chooseRole(role, state: state),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (state.hasError)
              Text(
                state.errorText!,
                style: const TextStyle(color: pKcolor),
              ),
          ],
        );
      },
    );
  }
}
