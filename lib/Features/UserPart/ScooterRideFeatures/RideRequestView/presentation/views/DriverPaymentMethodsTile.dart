import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppAssets.dart';
import 'package:yallanow/Core/utlis/AppSizes.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/Manager/check_payment_method_cubit/check_payment_method_cubit.dart';
import 'package:yallanow/Core/widgets/Checkout%20Sec/PayMethodCard.dart';
import 'package:yallanow/Features/UserPart/ScooterRideFeatures/RideRequestView/presentation/manager/check_wallet_balance_cubit/check_wallet_balance_cubit.dart';
import 'package:yallanow/generated/l10n.dart';

class DriverPaymentMethodsTile extends StatefulWidget {
  const DriverPaymentMethodsTile({Key? key}) : super(key: key);

  @override
  _DriverPaymentMethodsTileState createState() =>
      _DriverPaymentMethodsTileState();
}

class _DriverPaymentMethodsTileState extends State<DriverPaymentMethodsTile> {
  PaymentMethod? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = PaymentMethod.cash;
  }

  void _handlePaymentMethodSelected(PaymentMethod value) {
    setState(() {
      selectedValue = value;
    });
    BlocProvider.of<CheckPaymentMethodCubit>(context)
        .updatePaymentMethod(method: value);
  }

  Widget _buildPaymentMethodCard({
    required String method,
    required PaymentMethod value,
    required Widget img,
    bool enabled = true,
  }) {
    return PayMethodCard(
      method: method,
      value: value,
      groupValue: selectedValue,
      onChanged:
          enabled ? (value) => _handlePaymentMethodSelected(value) : null,
      img: img,
      enabled: enabled,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckPaymentMethodCubit, CheckPaymentMethodState>(
      builder: (context, state) {
        if (state is CheckPaymentMethodChange) {
          selectedValue = state.methode;

          return Column(
            children: [
              _buildPaymentMethodCard(
                method: S.of(context).Cash,
                value: PaymentMethod.cash,
                img: SvgPicture.asset(Assets.imagesCashICon,
                    height: 20, width: 20),
              ),
              const SizedBox(height: 16),
              BlocBuilder<CheckWalletBalanceCubit, CheckWalletBalanceState>(
                builder: (context, walletState) {
                  bool valid = walletState is CheckWalletBalanceSuccess
                      ? walletState.valid
                      : true;
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildPaymentMethodCard(
                          method: S.of(context).Wallet,
                          value: PaymentMethod.wallet,
                          img: SvgPicture.asset(Assets.imagesCashICon,
                              height: 20, width: 20),
                          enabled: valid,
                        ),
                        const Gap(8),
                        if (!valid)
                          Text(
                            S.of(context).NoBalanceWallet,
                            style: AppStyles.styleRegular12(context)
                                .copyWith(color: scColor),
                          )
                      ]);
                },
              ),
              const SizedBox(height: 16),
              _buildPaymentMethodCard(
                method: S.of(context).CreditCard,
                value: PaymentMethod.creditCard,
                img: Image.asset(
                  Assets.imagesCreditcardIcon,
                  height: AppSizes.getHeight(20, context),
                  width: AppSizes.getWidth(20, context),
                ),
              ),
            ],
          );
        } else {
          return Column(
            children: [
              _buildPaymentMethodCard(
                method: S.of(context).Cash,
                value: PaymentMethod.cash,
                img: SvgPicture.asset(Assets.imagesCashICon,
                    height: 20, width: 20),
              ),
              const SizedBox(height: 16),
              BlocBuilder<CheckWalletBalanceCubit, CheckWalletBalanceState>(
                builder: (context, walletState) {
                  bool valid = walletState is CheckWalletBalanceSuccess
                      ? walletState.valid
                      : true;
                  return Column(children: [
                    _buildPaymentMethodCard(
                      method: S.of(context).Wallet,
                      value: PaymentMethod.wallet,
                      img: SvgPicture.asset(Assets.imagesCashICon,
                          height: 20, width: 20),
                      enabled: valid,
                    ),
                    const Gap(8),
                    if (!valid)
                      Text(
                        S.of(context).NoBalanceWallet,
                        style: AppStyles.styleRegular12(context)
                            .copyWith(color: scColor),
                      )
                  ]);
                },
              ),
              const SizedBox(height: 16),
              _buildPaymentMethodCard(
                method: S.of(context).CreditCard,
                value: PaymentMethod.creditCard,
                img: Image.asset(
                  Assets.imagesCreditcardIcon,
                  height: AppSizes.getHeight(20, context),
                  width: AppSizes.getWidth(20, context),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
