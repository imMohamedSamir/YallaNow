import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/manager/driver_registeration_cubit/driver_registeration_cubit.dart';
import 'package:yallanow/Features/DriverPart/DriverRegisterationView/presentation/views/RiderRoleRadio.dart';
import 'package:yallanow/generated/l10n.dart';

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
            RiderRoleRadio(
              title: S.of(context).AsDelivery,
              icon: Assets.imagesDeliveryIcon,
              value: RiderRole.delivery,
              groupValue: selectedRole,
              onChanged: (role) => chooseRole(role, state: state),
            ),
            const SizedBox(height: 8),
            RiderRoleRadio(
              title: S.of(context).AsCaptin,
              icon: Assets.imagesCaptinIcon,
              value: RiderRole.captin,
              groupValue: selectedRole,
              onChanged: (role) => chooseRole(role, state: state),
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
