// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign in`
  String get SignIn {
    return Intl.message(
      'Sign in',
      name: 'SignIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get SignUp {
    return Intl.message(
      'Sign up',
      name: 'SignUp',
      desc: '',
      args: [],
    );
  }

  /// `Create a new account`
  String get CreateAccount {
    return Intl.message(
      'Create a new account',
      name: 'CreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get FirstName {
    return Intl.message(
      'First Name',
      name: 'FirstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get LastName {
    return Intl.message(
      'Last Name',
      name: 'LastName',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get PhoneNumber {
    return Intl.message(
      'Phone number',
      name: 'PhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Password`
  String get Password {
    return Intl.message(
      'Enter Your Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmedPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmedPassword',
      desc: '',
      args: [],
    );
  }

  /// `National Identity`
  String get NId {
    return Intl.message(
      'National Identity',
      name: 'NId',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get Male {
    return Intl.message(
      'Male',
      name: 'Male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get Female {
    return Intl.message(
      'Female',
      name: 'Female',
      desc: '',
      args: [],
    );
  }

  /// `الفيش و التشبيه`
  String get feesh {
    return Intl.message(
      'الفيش و التشبيه',
      name: 'feesh',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get Next {
    return Intl.message(
      'Next',
      name: 'Next',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Already have account ?`
  String get already_have_account {
    return Intl.message(
      'Already have account ?',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `By registering, you agree to our`
  String get Terms1 {
    return Intl.message(
      'By registering, you agree to our',
      name: 'Terms1',
      desc: '',
      args: [],
    );
  }

  /// `  Terms and Conditions`
  String get Terms2 {
    return Intl.message(
      '  Terms and Conditions',
      name: 'Terms2',
      desc: '',
      args: [],
    );
  }

  /// `Trips`
  String get Trips {
    return Intl.message(
      'Trips',
      name: 'Trips',
      desc: '',
      args: [],
    );
  }

  /// `/ Person`
  String get PerPerson {
    return Intl.message(
      '/ Person',
      name: 'PerPerson',
      desc: '',
      args: [],
    );
  }

  /// `Explore trips`
  String get Exploretrips {
    return Intl.message(
      'Explore trips',
      name: 'Exploretrips',
      desc: '',
      args: [],
    );
  }

  /// `Scooter Ride`
  String get scooterRide {
    return Intl.message(
      'Scooter Ride',
      name: 'scooterRide',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Help Center`
  String get HelpCenter {
    return Intl.message(
      'Help Center',
      name: 'HelpCenter',
      desc: '',
      args: [],
    );
  }

  /// `Invite Friends`
  String get InviteFriends {
    return Intl.message(
      'Invite Friends',
      name: 'InviteFriends',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get PrivacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'PrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editprofile {
    return Intl.message(
      'Edit Profile',
      name: 'editprofile',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Where to ?`
  String get whereTo {
    return Intl.message(
      'Where to ?',
      name: 'whereTo',
      desc: '',
      args: [],
    );
  }

  /// `Recent places`
  String get Recentplaces {
    return Intl.message(
      'Recent places',
      name: 'Recentplaces',
      desc: '',
      args: [],
    );
  }

  /// `Result places`
  String get Resultplaces {
    return Intl.message(
      'Result places',
      name: 'Resultplaces',
      desc: '',
      args: [],
    );
  }

  /// `Choose a ride`
  String get Choosearide {
    return Intl.message(
      'Choose a ride',
      name: 'Choosearide',
      desc: '',
      args: [],
    );
  }

  /// `Finding your Driver`
  String get Findingyourider {
    return Intl.message(
      'Finding your Driver',
      name: 'Findingyourider',
      desc: '',
      args: [],
    );
  }

  /// `Pay with`
  String get Paywith {
    return Intl.message(
      'Pay with',
      name: 'Paywith',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `Choose`
  String get Choose {
    return Intl.message(
      'Choose',
      name: 'Choose',
      desc: '',
      args: [],
    );
  }

  /// `Ride Payment`
  String get RidePayment {
    return Intl.message(
      'Ride Payment',
      name: 'RidePayment',
      desc: '',
      args: [],
    );
  }

  /// `Yalla`
  String get Yalla {
    return Intl.message(
      'Yalla',
      name: 'Yalla',
      desc: '',
      args: [],
    );
  }

  /// `Places`
  String get places {
    return Intl.message(
      'Places',
      name: 'places',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message(
      'View All',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Popular Trips`
  String get PopularTrips {
    return Intl.message(
      'Popular Trips',
      name: 'PopularTrips',
      desc: '',
      args: [],
    );
  }

  /// `Trips Types`
  String get TripsType {
    return Intl.message(
      'Trips Types',
      name: 'TripsType',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get Duration {
    return Intl.message(
      'Duration',
      name: 'Duration',
      desc: '',
      args: [],
    );
  }

  /// `Overview`
  String get Overview {
    return Intl.message(
      'Overview',
      name: 'Overview',
      desc: '',
      args: [],
    );
  }

  /// `Program`
  String get Program {
    return Intl.message(
      'Program',
      name: 'Program',
      desc: '',
      args: [],
    );
  }

  /// `Take with you`
  String get Takewithyou {
    return Intl.message(
      'Take with you',
      name: 'Takewithyou',
      desc: '',
      args: [],
    );
  }

  /// `Include`
  String get Include {
    return Intl.message(
      'Include',
      name: 'Include',
      desc: '',
      args: [],
    );
  }

  /// `Not include`
  String get Notinclude {
    return Intl.message(
      'Not include',
      name: 'Notinclude',
      desc: '',
      args: [],
    );
  }

  /// `Book`
  String get Book {
    return Intl.message(
      'Book',
      name: 'Book',
      desc: '',
      args: [],
    );
  }

  /// `Registration Form`
  String get RegistrationForm {
    return Intl.message(
      'Registration Form',
      name: 'RegistrationForm',
      desc: '',
      args: [],
    );
  }

  /// `Please full the form and we will contact you`
  String get RegistrationDsc {
    return Intl.message(
      'Please full the form and we will contact you',
      name: 'RegistrationDsc',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get TravellerName {
    return Intl.message(
      'Name',
      name: 'TravellerName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Name`
  String get NameValidation {
    return Intl.message(
      'Please enter your Name',
      name: 'NameValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Phone Number`
  String get PhoneValidation {
    return Intl.message(
      'Please enter your Phone Number',
      name: 'PhoneValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter correct mobile number`
  String get correctPhoneNumber {
    return Intl.message(
      'Please enter correct mobile number',
      name: 'correctPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Email`
  String get MailValidation {
    return Intl.message(
      'Please enter your Email',
      name: 'MailValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter correct E-Mail address`
  String get correctEmail {
    return Intl.message(
      'Please enter correct E-Mail address',
      name: 'correctEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Nationality`
  String get NationalityValidation {
    return Intl.message(
      'Please enter your Nationality',
      name: 'NationalityValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Location`
  String get LocationValidation {
    return Intl.message(
      'Please enter your Location',
      name: 'LocationValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter number of adults`
  String get adultValidation {
    return Intl.message(
      'Please enter number of adults',
      name: 'adultValidation',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get Nationality {
    return Intl.message(
      'Nationality',
      name: 'Nationality',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get Location {
    return Intl.message(
      'Location',
      name: 'Location',
      desc: '',
      args: [],
    );
  }

  /// `Hotel`
  String get Hotel {
    return Intl.message(
      'Hotel',
      name: 'Hotel',
      desc: '',
      args: [],
    );
  }

  /// `Room`
  String get Room {
    return Intl.message(
      'Room',
      name: 'Room',
      desc: '',
      args: [],
    );
  }

  /// `Number of adult`
  String get Numberofadult {
    return Intl.message(
      'Number of adult',
      name: 'Numberofadult',
      desc: '',
      args: [],
    );
  }

  /// `Number of Kids`
  String get NumberofKids {
    return Intl.message(
      'Number of Kids',
      name: 'NumberofKids',
      desc: '',
      args: [],
    );
  }

  /// `Number of Juniors`
  String get NumberofJuniors {
    return Intl.message(
      'Number of Juniors',
      name: 'NumberofJuniors',
      desc: '',
      args: [],
    );
  }

  /// `Your data has been registered successfully. We will contact you.`
  String get SuccessBook {
    return Intl.message(
      'Your data has been registered successfully. We will contact you.',
      name: 'SuccessBook',
      desc: '',
      args: [],
    );
  }

  /// `Session Expired`
  String get SessionExpired {
    return Intl.message(
      'Session Expired',
      name: 'SessionExpired',
      desc: '',
      args: [],
    );
  }

  /// `Your session has expired. Please log in again.`
  String get SessionExpiredMsg {
    return Intl.message(
      'Your session has expired. Please log in again.',
      name: 'SessionExpiredMsg',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get Ok {
    return Intl.message(
      'Ok',
      name: 'Ok',
      desc: '',
      args: [],
    );
  }

  /// `Didn't have an account ? `
  String get havntaccount {
    return Intl.message(
      'Didn\'t have an account ? ',
      name: 'havntaccount',
      desc: '',
      args: [],
    );
  }

  /// `or continue with`
  String get continuewith {
    return Intl.message(
      'or continue with',
      name: 'continuewith',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get PassValidation {
    return Intl.message(
      'Please enter your password',
      name: 'PassValidation',
      desc: '',
      args: [],
    );
  }

  /// `Forget password?`
  String get passForget {
    return Intl.message(
      'Forget password?',
      name: 'passForget',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your first name`
  String get firstnameValidation {
    return Intl.message(
      'Please enter your first name',
      name: 'firstnameValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your last name`
  String get lasnameValidation {
    return Intl.message(
      'Please enter your last name',
      name: 'lasnameValidation',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get userName {
    return Intl.message(
      'User Name',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your username`
  String get usernameValidation {
    return Intl.message(
      'Please enter your username',
      name: 'usernameValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please Confirm your password`
  String get confirmPassvalidation {
    return Intl.message(
      'Please Confirm your password',
      name: 'confirmPassvalidation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter same password`
  String get confirmPassCorrectation {
    return Intl.message(
      'Please enter same password',
      name: 'confirmPassCorrectation',
      desc: '',
      args: [],
    );
  }

  /// `Sign up as a rider`
  String get SignUprider {
    return Intl.message(
      'Sign up as a rider',
      name: 'SignUprider',
      desc: '',
      args: [],
    );
  }

  /// `   Please choose your gender`
  String get GenderValidation {
    return Intl.message(
      '   Please choose your gender',
      name: 'GenderValidation',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get Wallet {
    return Intl.message(
      'Wallet',
      name: 'Wallet',
      desc: '',
      args: [],
    );
  }

  /// `Logout of your account ?`
  String get Logoutofyouraccount {
    return Intl.message(
      'Logout of your account ?',
      name: 'Logoutofyouraccount',
      desc: '',
      args: [],
    );
  }

  /// `change`
  String get change {
    return Intl.message(
      'change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `I will wait`
  String get Iwait {
    return Intl.message(
      'I will wait',
      name: 'Iwait',
      desc: '',
      args: [],
    );
  }

  /// `Total amount`
  String get Totalamount {
    return Intl.message(
      'Total amount',
      name: 'Totalamount',
      desc: '',
      args: [],
    );
  }

  /// `Disable`
  String get Disable {
    return Intl.message(
      'Disable',
      name: 'Disable',
      desc: '',
      args: [],
    );
  }

  /// `Enter current place`
  String get Entercurrentplace {
    return Intl.message(
      'Enter current place',
      name: 'Entercurrentplace',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get PaymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'PaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get Accept {
    return Intl.message(
      'Accept',
      name: 'Accept',
      desc: '',
      args: [],
    );
  }

  /// `Searching for requests`
  String get Searchingforrequests {
    return Intl.message(
      'Searching for requests',
      name: 'Searchingforrequests',
      desc: '',
      args: [],
    );
  }

  /// `Are you ready to search for requests`
  String get readytosearchforrequests {
    return Intl.message(
      'Are you ready to search for requests',
      name: 'readytosearchforrequests',
      desc: '',
      args: [],
    );
  }

  /// `Enable your location`
  String get Enableyourlocation {
    return Intl.message(
      'Enable your location',
      name: 'Enableyourlocation',
      desc: '',
      args: [],
    );
  }

  /// `enable your location to get requests in your current area`
  String get EnableLocationMsg {
    return Intl.message(
      'enable your location to get requests in your current area',
      name: 'EnableLocationMsg',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
