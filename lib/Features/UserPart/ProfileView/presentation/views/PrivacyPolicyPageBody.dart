import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';
import 'package:yallanow/generated/l10n.dart';

class PrivacyPolicyPageBody extends StatelessWidget {
  const PrivacyPolicyPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // _buildSectionTitle(context, "Types of Data We Collect"),
            // const Gap(16),
            _buildIntroductionSection(context),
            const Gap(16),
            _buildPaymentMethodsSection(context),
            const Gap(16),
            _buildPaymentSecuritySection(context),
            const Gap(16),
            _buildPaymentConfirmationSection(context),
            const Gap(16),
            _buildCurrencySection(context),
            const Gap(16),
            _buildRefundsAndCancellationsSection(context),
            const Gap(16),
            _buildFailedTransactionsSection(context),
            const Gap(16),
            _buildContactInformationSection(context),
            const Gap(16),
            _buildTermsAndConditionsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: AppStyles.styleBold18(context)
          .copyWith(fontSize: 20, color: blackdcolor),
    );
  }

  Widget _buildIntroductionSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).introductionTitle,
          style: AppStyles.styleBold16(context).copyWith(color: blackdcolor),
        ),
        Text(
          S.of(context).introductionContent,
          style: AppStyles.styleRegular14(context)
              .copyWith(color: scColor, height: 1.9),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).paymentMethodsTitle,
          style: AppStyles.styleBold16(context).copyWith(color: blackdcolor),
        ),
        Text(
          S.of(context).paymentMethodsContent,
          style: AppStyles.styleRegular14(context)
              .copyWith(color: scColor, height: 1.9),
        ),
      ],
    );
  }

  Widget _buildPaymentSecuritySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).paymentSecurityTitle,
          style: AppStyles.styleBold16(context).copyWith(color: blackdcolor),
        ),
        Text(
          S.of(context).paymentSecurityContent,
          style: AppStyles.styleRegular14(context)
              .copyWith(color: scColor, height: 1.9),
        ),
      ],
    );
  }

  Widget _buildPaymentConfirmationSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).paymentConfirmationTitle,
          style: AppStyles.styleBold16(context).copyWith(color: blackdcolor),
        ),
        Text(
          S.of(context).paymentConfirmationContent,
          style: AppStyles.styleRegular14(context)
              .copyWith(color: scColor, height: 1.9),
        ),
      ],
    );
  }

  Widget _buildCurrencySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).currencyTitle,
          style: AppStyles.styleBold16(context).copyWith(color: blackdcolor),
        ),
        Text(
          S.of(context).currencyContent,
          style: AppStyles.styleRegular14(context)
              .copyWith(color: scColor, height: 1.9),
        ),
      ],
    );
  }

  Widget _buildRefundsAndCancellationsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).refundsAndCancellationsTitle,
          style: AppStyles.styleBold16(context).copyWith(color: blackdcolor),
        ),
        Text(
          S.of(context).refundsAndCancellationsContent,
          style: AppStyles.styleRegular14(context)
              .copyWith(color: scColor, height: 1.9),
        ),
      ],
    );
  }

  Widget _buildFailedTransactionsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).failedTransactionsTitle,
          style: AppStyles.styleBold16(context).copyWith(color: blackdcolor),
        ),
        Text(
          S.of(context).failedTransactionsContent,
          style: AppStyles.styleRegular14(context)
              .copyWith(color: scColor, height: 1.9),
        ),
      ],
    );
  }

  Widget _buildContactInformationSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).contactInformationTitle,
          style: AppStyles.styleBold16(context).copyWith(color: blackdcolor),
        ),
        Text(
          S.of(context).contactInformationContent,
          style: AppStyles.styleRegular14(context)
              .copyWith(color: scColor, height: 1.9),
        ),
      ],
    );
  }

  Widget _buildTermsAndConditionsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).termsAndConditionsTitle,
          style: AppStyles.styleBold16(context).copyWith(color: blackdcolor),
        ),
        Text(
          S.of(context).termsAndConditionsContent,
          style: AppStyles.styleRegular14(context)
              .copyWith(color: scColor, height: 1.9),
        ),
      ],
    );
  }
}
