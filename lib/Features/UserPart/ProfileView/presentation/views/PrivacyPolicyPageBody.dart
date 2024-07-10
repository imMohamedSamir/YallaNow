import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yallanow/Core/utlis/AppStyles.dart';
import 'package:yallanow/Core/utlis/Constatnts.dart';

class PrivacyPolicyPageBody extends StatelessWidget {
  const PrivacyPolicyPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Types of Data We Collect",
                style: AppStyles.styleBold18(context)
                    .copyWith(fontSize: 20, color: blackdcolor)),
            const Gap(16),
            Text(
              """
        1. Introduction
        Welcome to Yalla Now Travel. This Online Payment Policy outlines the terms and conditions for online transactions conducted through our website.
        
        2. Payment Methods
        We accept the following payment methods for online bookings:
        
        Credit Cards (Visa, MasterCard, American Express)
        Debit Cards
        PayPal
        Bank Transfers
        3. Payment Security
        We use secure encryption technology to protect your payment information. All transactions are processed through a secure payment gateway, ensuring the safety of your personal and financial details.
        
        4. Payment Confirmation
        Once your payment is successfully processed, you will receive an email confirmation with your booking details. Please retain this email as proof of payment.
        
        5. Currency
        All prices listed on our website are in [Currency]. Payments must be made in the currency specified.
        
        6. Refunds and Cancellations
        Refunds for canceled bookings will be processed according to our Cancellation Policy.
        Please refer to our Cancellation Policy for details on how to request a refund.
        7. Failed Transactions
        If your payment transaction fails, please try again or contact our customer support team for assistance.
        
        8. Contact Information
        For any questions or concerns regarding online payments, please contact us at:
        
        Email: [email address]
        Phone: [phone number]
        Terms and Conditions
        1. Introduction
        These Terms and Conditions govern your use of the Yalla Now Travel website and the services provided by us. By using our website, you agree to these Terms and Conditions.
        
        2. Booking and Reservations
        All bookings are subject to availability.
        Prices and availability are subject to change without notice.
        3. Payment
        Full payment is required at the time of booking.
        Payments are accepted through the methods listed in our Online Payment Policy.
        4. Cancellation and Refunds
        Cancellations must be made in accordance with our Cancellation Policy.
        Refunds will be processed based on the terms outlined in the Cancellation Policy.
        5. Changes to Bookings
        Changes to bookings are subject to availability and may incur additional charges.
        Please contact our customer support team to request changes to your booking.
        6. Travel Documents
        It is your responsibility to ensure that you have the necessary travel documents, including passports and visas.
        Yalla Now Travel is not responsible for any issues arising from incomplete or incorrect travel documentation.
        7. Limitation of Liability
        Yalla Now Travel is not liable for any direct, indirect, incidental, or consequential damages arising from the use of our services.
        We are not responsible for any delays, cancellations, or changes in travel arrangements caused by third-party service providers.
        8. Privacy Policy
        Your personal information is protected in accordance with our Privacy Policy.
        Please refer to our Privacy Policy for details on how we collect, use, and protect your information.
        9. Governing Law
        These Terms and Conditions are governed by the laws of [Country/State].
        Any disputes arising from these terms will be resolved in the courts of [Country/State].
        10. Changes to Terms and Conditions
        We reserve the right to modify these Terms and Conditions at any time.
        Any changes will be posted on our website, and continued use of our services constitutes acceptance of the updated terms.
        11. Contact Information
        For any questions or concerns regarding these Terms and Conditions, please contact us at:""",
              style: AppStyles.styleRegular14(context)
                  .copyWith(color: scColor, height: 1.9),
            )
          ],
        ),
      ),
    );
  }
}
