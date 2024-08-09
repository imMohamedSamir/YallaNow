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

  /// `Are you want to cancel the ride?`
  String get cancelRidequestion {
    return Intl.message(
      'Are you want to cancel the ride?',
      name: 'cancelRidequestion',
      desc: '',
      args: [],
    );
  }

  /// `Your ride for this will be cancle.`
  String get cancelRideMsg {
    return Intl.message(
      'Your ride for this will be cancle.',
      name: 'cancelRideMsg',
      desc: '',
      args: [],
    );
  }

  /// `Driver and vehicle Details`
  String get DriverAndVehicle {
    return Intl.message(
      'Driver and vehicle Details',
      name: 'DriverAndVehicle',
      desc: '',
      args: [],
    );
  }

  /// `Driver details`
  String get Driverdetails {
    return Intl.message(
      'Driver details',
      name: 'Driverdetails',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your National ID`
  String get NIdValidation {
    return Intl.message(
      'Please enter your National ID',
      name: 'NIdValidation',
      desc: '',
      args: [],
    );
  }

  /// `National ID should be 16 digits`
  String get NIDcorrection {
    return Intl.message(
      'National ID should be 16 digits',
      name: 'NIDcorrection',
      desc: '',
      args: [],
    );
  }

  /// `Please select a role`
  String get selectroleValidation {
    return Intl.message(
      'Please select a role',
      name: 'selectroleValidation',
      desc: '',
      args: [],
    );
  }

  /// `As Delivery`
  String get AsDelivery {
    return Intl.message(
      'As Delivery',
      name: 'AsDelivery',
      desc: '',
      args: [],
    );
  }

  /// `As Captin`
  String get AsCaptin {
    return Intl.message(
      'As Captin',
      name: 'AsCaptin',
      desc: '',
      args: [],
    );
  }

  /// `Please select your Image`
  String get SelectDriverImgValidation {
    return Intl.message(
      'Please select your Image',
      name: 'SelectDriverImgValidation',
      desc: '',
      args: [],
    );
  }

  /// `License Plate`
  String get licensePlate {
    return Intl.message(
      'License Plate',
      name: 'licensePlate',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle color`
  String get VehicleColor {
    return Intl.message(
      'Vehicle color',
      name: 'VehicleColor',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle model`
  String get vehicleModel {
    return Intl.message(
      'Vehicle model',
      name: 'vehicleModel',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your vehicle model`
  String get vehicleModelValidation {
    return Intl.message(
      'Please enter your vehicle model',
      name: 'vehicleModelValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your vehicle color`
  String get vehicleColorValidation {
    return Intl.message(
      'Please enter your vehicle color',
      name: 'vehicleColorValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your vehicle license Plate`
  String get licensePlateValidation {
    return Intl.message(
      'Please enter your vehicle license Plate',
      name: 'licensePlateValidation',
      desc: '',
      args: [],
    );
  }

  /// `Driver Papers`
  String get driverPapers {
    return Intl.message(
      'Driver Papers',
      name: 'driverPapers',
      desc: '',
      args: [],
    );
  }

  /// `Please upload your Papers`
  String get driverPapersValidation {
    return Intl.message(
      'Please upload your Papers',
      name: 'driverPapersValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please upload your file as PDF`
  String get driverPapersCorrection {
    return Intl.message(
      'Please upload your file as PDF',
      name: 'driverPapersCorrection',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle year`
  String get vehicleYear {
    return Intl.message(
      'Vehicle year',
      name: 'vehicleYear',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your vehicle year`
  String get vehicleYearValidation {
    return Intl.message(
      'Please enter your vehicle year',
      name: 'vehicleYearValidation',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle details`
  String get VehicleDetails {
    return Intl.message(
      'Vehicle details',
      name: 'VehicleDetails',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Type`
  String get VehicleType {
    return Intl.message(
      'Vehicle Type',
      name: 'VehicleType',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your vehicle type`
  String get vehicleTypeValidation {
    return Intl.message(
      'Please enter your vehicle type',
      name: 'vehicleTypeValidation',
      desc: '',
      args: [],
    );
  }

  /// `Image directions`
  String get imageDirections {
    return Intl.message(
      'Image directions',
      name: 'imageDirections',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle images`
  String get VehicleImages {
    return Intl.message(
      'Vehicle images',
      name: 'VehicleImages',
      desc: '',
      args: [],
    );
  }

  /// `Please upload all 4 vehicle images.`
  String get vehicleImagesValidation {
    return Intl.message(
      'Please upload all 4 vehicle images.',
      name: 'vehicleImagesValidation',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your address`
  String get addressValidation {
    return Intl.message(
      'Please enter your address',
      name: 'addressValidation',
      desc: '',
      args: [],
    );
  }

  /// `At least 8 characters`
  String get atLest8 {
    return Intl.message(
      'At least 8 characters',
      name: 'atLest8',
      desc: '',
      args: [],
    );
  }

  /// `UpperCase letter`
  String get upperCaseLetter {
    return Intl.message(
      'UpperCase letter',
      name: 'upperCaseLetter',
      desc: '',
      args: [],
    );
  }

  /// `LowerCase letter`
  String get lowerCaseLetter {
    return Intl.message(
      'LowerCase letter',
      name: 'lowerCaseLetter',
      desc: '',
      args: [],
    );
  }

  /// `Number character`
  String get numericCharacter {
    return Intl.message(
      'Number character',
      name: 'numericCharacter',
      desc: '',
      args: [],
    );
  }

  /// `Special character`
  String get specialCharacter {
    return Intl.message(
      'Special character',
      name: 'specialCharacter',
      desc: '',
      args: [],
    );
  }

  /// `(اجبارى) صورة البطاقة امامى و خلفى`
  String get id_card {
    return Intl.message(
      '(اجبارى) صورة البطاقة امامى و خلفى',
      name: 'id_card',
      desc: '',
      args: [],
    );
  }

  /// `(اجبارى) صورة رخصة القيادة امامى و خلفى`
  String get driving_license {
    return Intl.message(
      '(اجبارى) صورة رخصة القيادة امامى و خلفى',
      name: 'driving_license',
      desc: '',
      args: [],
    );
  }

  /// `(اجبارى) صورة رخصة السكوتر امامى و خلفى`
  String get scooter_license {
    return Intl.message(
      '(اجبارى) صورة رخصة السكوتر امامى و خلفى',
      name: 'scooter_license',
      desc: '',
      args: [],
    );
  }

  /// `(اجبارى) فيش وتشبية موجه لشركة يلا ناو`
  String get criminal_record {
    return Intl.message(
      '(اجبارى) فيش وتشبية موجه لشركة يلا ناو',
      name: 'criminal_record',
      desc: '',
      args: [],
    );
  }

  /// `(مؤقت 15) صورة شهادة ميلاد`
  String get birth_certificate {
    return Intl.message(
      '(مؤقت 15) صورة شهادة ميلاد',
      name: 'birth_certificate',
      desc: '',
      args: [],
    );
  }

  /// `تحليل مخدرات`
  String get drug_test {
    return Intl.message(
      'تحليل مخدرات',
      name: 'drug_test',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get Orders {
    return Intl.message(
      'Orders',
      name: 'Orders',
      desc: '',
      args: [],
    );
  }

  /// `Rides`
  String get rides {
    return Intl.message(
      'Rides',
      name: 'rides',
      desc: '',
      args: [],
    );
  }

  /// `Ratings`
  String get Ratings {
    return Intl.message(
      'Ratings',
      name: 'Ratings',
      desc: '',
      args: [],
    );
  }

  /// `Share ride details`
  String get Shareridedetails {
    return Intl.message(
      'Share ride details',
      name: 'Shareridedetails',
      desc: '',
      args: [],
    );
  }

  /// `call the Driver`
  String get calltheDriver {
    return Intl.message(
      'call the Driver',
      name: 'calltheDriver',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to cancel the trip? A fee will be applied`
  String get cancellationWarning {
    return Intl.message(
      'Are you sure you want to cancel the trip? A fee will be applied',
      name: 'cancellationWarning',
      desc: '',
      args: [],
    );
  }

  /// `Trips details`
  String get tripdetails {
    return Intl.message(
      'Trips details',
      name: 'tripdetails',
      desc: '',
      args: [],
    );
  }

  /// `Total distance`
  String get totalDistance {
    return Intl.message(
      'Total distance',
      name: 'totalDistance',
      desc: '',
      args: [],
    );
  }

  /// `Km`
  String get Km {
    return Intl.message(
      'Km',
      name: 'Km',
      desc: '',
      args: [],
    );
  }

  /// `How was your driver?`
  String get RatingDriverQ {
    return Intl.message(
      'How was your driver?',
      name: 'RatingDriverQ',
      desc: '',
      args: [],
    );
  }

  /// `How was your trip?`
  String get RatingTripQ {
    return Intl.message(
      'How was your trip?',
      name: 'RatingTripQ',
      desc: '',
      args: [],
    );
  }

  /// `Comment`
  String get comment {
    return Intl.message(
      'Comment',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `User cancelled trip`
  String get userCancelRide {
    return Intl.message(
      'User cancelled trip',
      name: 'userCancelRide',
      desc: '',
      args: [],
    );
  }

  /// `go to home page to receive more requests`
  String get userCancelRideMsg {
    return Intl.message(
      'go to home page to receive more requests',
      name: 'userCancelRideMsg',
      desc: '',
      args: [],
    );
  }

  /// `driver cancelled trip`
  String get driverCancelRide {
    return Intl.message(
      'driver cancelled trip',
      name: 'driverCancelRide',
      desc: '',
      args: [],
    );
  }

  /// `please try again `
  String get driverCancelRideMsg {
    return Intl.message(
      'please try again ',
      name: 'driverCancelRideMsg',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get Checkout {
    return Intl.message(
      'Checkout',
      name: 'Checkout',
      desc: '',
      args: [],
    );
  }

  /// `The user charges`
  String get usercharges {
    return Intl.message(
      'The user charges',
      name: 'usercharges',
      desc: '',
      args: [],
    );
  }

  /// `Verification phone number`
  String get VerificationWithphonenumber {
    return Intl.message(
      'Verification phone number',
      name: 'VerificationWithphonenumber',
      desc: '',
      args: [],
    );
  }

  /// `Forget password`
  String get ForgetPassword {
    return Intl.message(
      'Forget password',
      name: 'ForgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message(
      'Continue',
      name: 'Continue',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get Notifications {
    return Intl.message(
      'Notifications',
      name: 'Notifications',
      desc: '',
      args: [],
    );
  }

  /// `Verification your Email`
  String get VerificationWithMail {
    return Intl.message(
      'Verification your Email',
      name: 'VerificationWithMail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email to send reset code`
  String get VerificationWithMailMsg {
    return Intl.message(
      'Please enter your email to send reset code',
      name: 'VerificationWithMailMsg',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get ResetPassword {
    return Intl.message(
      'Reset password',
      name: 'ResetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Choose way to receive Reset code`
  String get chooseRestWay {
    return Intl.message(
      'Choose way to receive Reset code',
      name: 'chooseRestWay',
      desc: '',
      args: [],
    );
  }

  /// `Reset via Phone`
  String get ResetviaPhone {
    return Intl.message(
      'Reset via Phone',
      name: 'ResetviaPhone',
      desc: '',
      args: [],
    );
  }

  /// `Code has been send to`
  String get CodeSentMsg {
    return Intl.message(
      'Code has been send to',
      name: 'CodeSentMsg',
      desc: '',
      args: [],
    );
  }

  /// `Captin Profile`
  String get CaptinProfile {
    return Intl.message(
      'Captin Profile',
      name: 'CaptinProfile',
      desc: '',
      args: [],
    );
  }

  /// `Total Orders`
  String get TotalTrips {
    return Intl.message(
      'Total Orders',
      name: 'TotalTrips',
      desc: '',
      args: [],
    );
  }

  /// `Total killos`
  String get TotalKillos {
    return Intl.message(
      'Total killos',
      name: 'TotalKillos',
      desc: '',
      args: [],
    );
  }

  /// `Total Ratings`
  String get totalRating {
    return Intl.message(
      'Total Ratings',
      name: 'totalRating',
      desc: '',
      args: [],
    );
  }

  /// `please fill your data to SignUp`
  String get SignUpMsg {
    return Intl.message(
      'please fill your data to SignUp',
      name: 'SignUpMsg',
      desc: '',
      args: [],
    );
  }

  /// `Didn’t receive code? `
  String get DidntReciveCode {
    return Intl.message(
      'Didn’t receive code? ',
      name: 'DidntReciveCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend again`
  String get resendAgain {
    return Intl.message(
      'Resend again',
      name: 'resendAgain',
      desc: '',
      args: [],
    );
  }

  /// `Set New password`
  String get SetNewpassword {
    return Intl.message(
      'Set New password',
      name: 'SetNewpassword',
      desc: '',
      args: [],
    );
  }

  /// `Set your new password`
  String get SetNewpasswordMsg {
    return Intl.message(
      'Set your new password',
      name: 'SetNewpasswordMsg',
      desc: '',
      args: [],
    );
  }

  /// `your password changed successfully`
  String get resetSuccesful {
    return Intl.message(
      'your password changed successfully',
      name: 'resetSuccesful',
      desc: '',
      args: [],
    );
  }

  /// `You need to be online `
  String get Youneedbeonline {
    return Intl.message(
      'You need to be online ',
      name: 'Youneedbeonline',
      desc: '',
      args: [],
    );
  }

  /// `You need be online to get requests in youe current area`
  String get youNeesBeOnlineMsg {
    return Intl.message(
      'You need be online to get requests in youe current area',
      name: 'youNeesBeOnlineMsg',
      desc: '',
      args: [],
    );
  }

  /// `My Trips`
  String get RidesHistory {
    return Intl.message(
      'My Trips',
      name: 'RidesHistory',
      desc: '',
      args: [],
    );
  }

  /// `View details`
  String get ViewDetails {
    return Intl.message(
      'View details',
      name: 'ViewDetails',
      desc: '',
      args: [],
    );
  }

  /// `Driver`
  String get Driver {
    return Intl.message(
      'Driver',
      name: 'Driver',
      desc: '',
      args: [],
    );
  }

  /// `Promo Code /coupon`
  String get PromoCode {
    return Intl.message(
      'Promo Code /coupon',
      name: 'PromoCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Promo Code to get the offer`
  String get enterPromoCode {
    return Intl.message(
      'Enter your Promo Code to get the offer',
      name: 'enterPromoCode',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get Submit {
    return Intl.message(
      'Submit',
      name: 'Submit',
      desc: '',
      args: [],
    );
  }

  /// `Add to Wallet`
  String get addToWallet {
    return Intl.message(
      'Add to Wallet',
      name: 'addToWallet',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get EGP {
    return Intl.message(
      'EGP',
      name: 'EGP',
      desc: '',
      args: [],
    );
  }

  /// `enter the amount received from the customer`
  String get CaptinwalletMsg {
    return Intl.message(
      'enter the amount received from the customer',
      name: 'CaptinwalletMsg',
      desc: '',
      args: [],
    );
  }

  /// ` will be added to customer's Wallet`
  String get CaptinwalletMsg2 {
    return Intl.message(
      ' will be added to customer\'s Wallet',
      name: 'CaptinwalletMsg2',
      desc: '',
      args: [],
    );
  }

  /// `Food & Resturants`
  String get Food {
    return Intl.message(
      'Food & Resturants',
      name: 'Food',
      desc: '',
      args: [],
    );
  }

  /// `pharmacy`
  String get pharmacy {
    return Intl.message(
      'pharmacy',
      name: 'pharmacy',
      desc: '',
      args: [],
    );
  }

  /// `Mart & Groceries`
  String get marts {
    return Intl.message(
      'Mart & Groceries',
      name: 'marts',
      desc: '',
      args: [],
    );
  }

  /// `please enter the amount received from the customer`
  String get addWalletValidation {
    return Intl.message(
      'please enter the amount received from the customer',
      name: 'addWalletValidation',
      desc: '',
      args: [],
    );
  }

  /// `the amoun added to customer Wallet`
  String get addWalletSuccessMsg {
    return Intl.message(
      'the amoun added to customer Wallet',
      name: 'addWalletSuccessMsg',
      desc: '',
      args: [],
    );
  }

  /// `save`
  String get Save {
    return Intl.message(
      'save',
      name: 'Save',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `successfully edit`
  String get editSuccess {
    return Intl.message(
      'successfully edit',
      name: 'editSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get DeleteAcc {
    return Intl.message(
      'Delete Account',
      name: 'DeleteAcc',
      desc: '',
      args: [],
    );
  }

  /// `Important Notice: Account Deletion`
  String get deleteAccQ {
    return Intl.message(
      'Important Notice: Account Deletion',
      name: 'deleteAccQ',
      desc: '',
      args: [],
    );
  }

  /// `Please be aware that by deleting your account, all associated data will be permanently deleted. This includes:`
  String get deleteAccMsg {
    return Intl.message(
      'Please be aware that by deleting your account, all associated data will be permanently deleted. This includes:',
      name: 'deleteAccMsg',
      desc: '',
      args: [],
    );
  }

  /// `Transactions such as orders and points.`
  String get deleteAccMsginclude1 {
    return Intl.message(
      'Transactions such as orders and points.',
      name: 'deleteAccMsginclude1',
      desc: '',
      args: [],
    );
  }

  /// `Personal information and account details.`
  String get deleteAccMsginclude2 {
    return Intl.message(
      'Personal information and account details.',
      name: 'deleteAccMsginclude2',
      desc: '',
      args: [],
    );
  }

  /// `Once your account is deleted, this data cannot be recovered. Please ensure you have saved any necessary information before proceeding.`
  String get deleteAccMsg2 {
    return Intl.message(
      'Once your account is deleted, this data cannot be recovered. Please ensure you have saved any necessary information before proceeding.',
      name: 'deleteAccMsg2',
      desc: '',
      args: [],
    );
  }

  /// `your account has been deleted`
  String get deletedSuccess {
    return Intl.message(
      'your account has been deleted',
      name: 'deletedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `You have no notifications at the moment. All your notifications will appear here.`
  String get noNotificationsMsg {
    return Intl.message(
      'You have no notifications at the moment. All your notifications will appear here.',
      name: 'noNotificationsMsg',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Promo Code`
  String get PromoCodeMsg {
    return Intl.message(
      'Enter your Promo Code',
      name: 'PromoCodeMsg',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Promo Code`
  String get promoCodeValidate {
    return Intl.message(
      'Please enter Promo Code',
      name: 'promoCodeValidate',
      desc: '',
      args: [],
    );
  }

  /// `please enter correct promo code`
  String get promoCodeCorrect {
    return Intl.message(
      'please enter correct promo code',
      name: 'promoCodeCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Promo Code applied successfully`
  String get PromoCodeSuccess {
    return Intl.message(
      'Promo Code applied successfully',
      name: 'PromoCodeSuccess',
      desc: '',
      args: [],
    );
  }

  /// `+20 1143888697`
  String get YallaNowPhone {
    return Intl.message(
      '+20 1143888697',
      name: 'YallaNowPhone',
      desc: '',
      args: [],
    );
  }

  /// `You have no rides at the moment. Go ahead and book your ride!`
  String get emptyRideMsg {
    return Intl.message(
      'You have no rides at the moment. Go ahead and book your ride!',
      name: 'emptyRideMsg',
      desc: '',
      args: [],
    );
  }

  /// `No drivers available Now , please try again later`
  String get NoDriversMsg {
    return Intl.message(
      'No drivers available Now , please try again later',
      name: 'NoDriversMsg',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get Cash {
    return Intl.message(
      'Cash',
      name: 'Cash',
      desc: '',
      args: [],
    );
  }

  /// `Credit Card`
  String get CreditCard {
    return Intl.message(
      'Credit Card',
      name: 'CreditCard',
      desc: '',
      args: [],
    );
  }

  /// `Insufficient wallet balance. Please choose another payment method.`
  String get NoBalanceWallet {
    return Intl.message(
      'Insufficient wallet balance. Please choose another payment method.',
      name: 'NoBalanceWallet',
      desc: '',
      args: [],
    );
  }

  /// `New Ride Request`
  String get NewRequest {
    return Intl.message(
      'New Ride Request',
      name: 'NewRequest',
      desc: '',
      args: [],
    );
  }

  /// `You have a new ride request. Tap to view details.`
  String get NewRequestBody {
    return Intl.message(
      'You have a new ride request. Tap to view details.',
      name: 'NewRequestBody',
      desc: '',
      args: [],
    );
  }

  /// `Deliver To`
  String get DeliverTo {
    return Intl.message(
      'Deliver To',
      name: 'DeliverTo',
      desc: '',
      args: [],
    );
  }

  /// `Bazar`
  String get Bazar {
    return Intl.message(
      'Bazar',
      name: 'Bazar',
      desc: '',
      args: [],
    );
  }

  /// `Basket`
  String get Basket {
    return Intl.message(
      'Basket',
      name: 'Basket',
      desc: '',
      args: [],
    );
  }

  /// `Add Items`
  String get AddItems {
    return Intl.message(
      'Add Items',
      name: 'AddItems',
      desc: '',
      args: [],
    );
  }

  /// `Payment Summary`
  String get PaymentSummary {
    return Intl.message(
      'Payment Summary',
      name: 'PaymentSummary',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Fee`
  String get DeliveryFee {
    return Intl.message(
      'Delivery Fee',
      name: 'DeliveryFee',
      desc: '',
      args: [],
    );
  }

  /// `Service Fee`
  String get ServiceFee {
    return Intl.message(
      'Service Fee',
      name: 'ServiceFee',
      desc: '',
      args: [],
    );
  }

  /// `Popular Marts`
  String get PopularMarts {
    return Intl.message(
      'Popular Marts',
      name: 'PopularMarts',
      desc: '',
      args: [],
    );
  }

  /// `Popular Resturants`
  String get PopularResturants {
    return Intl.message(
      'Popular Resturants',
      name: 'PopularResturants',
      desc: '',
      args: [],
    );
  }

  /// `Super Markets`
  String get SuperMarkets {
    return Intl.message(
      'Super Markets',
      name: 'SuperMarkets',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get Categories {
    return Intl.message(
      'Categories',
      name: 'Categories',
      desc: '',
      args: [],
    );
  }

  /// `Add To Basket`
  String get AddToBasket {
    return Intl.message(
      'Add To Basket',
      name: 'AddToBasket',
      desc: '',
      args: [],
    );
  }

  /// `Price on selection`
  String get PriceOnSelection {
    return Intl.message(
      'Price on selection',
      name: 'PriceOnSelection',
      desc: '',
      args: [],
    );
  }

  /// `Allow`
  String get Allow {
    return Intl.message(
      'Allow',
      name: 'Allow',
      desc: '',
      args: [],
    );
  }

  /// `Deny`
  String get Deny {
    return Intl.message(
      'Deny',
      name: 'Deny',
      desc: '',
      args: [],
    );
  }

  /// `Yalla Now App collects location data to enable Identification of nearby drivers,Resturants,marts and pharmacies even when the app is closed or not in use.`
  String get LocationPermissionMsg {
    return Intl.message(
      'Yalla Now App collects location data to enable Identification of nearby drivers,Resturants,marts and pharmacies even when the app is closed or not in use.',
      name: 'LocationPermissionMsg',
      desc: '',
      args: [],
    );
  }

  /// `Location Data Collection for Nearby Services`
  String get LocationPermissionTitle {
    return Intl.message(
      'Location Data Collection for Nearby Services',
      name: 'LocationPermissionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Pharamcies`
  String get Pharamcies {
    return Intl.message(
      'Pharamcies',
      name: 'Pharamcies',
      desc: '',
      args: [],
    );
  }

  /// `Best Seller`
  String get BestSeller {
    return Intl.message(
      'Best Seller',
      name: 'BestSeller',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Results`
  String get Results {
    return Intl.message(
      'Results',
      name: 'Results',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get Favorites {
    return Intl.message(
      'Favorites',
      name: 'Favorites',
      desc: '',
      args: [],
    );
  }

  /// `Addresses`
  String get Addresses {
    return Intl.message(
      'Addresses',
      name: 'Addresses',
      desc: '',
      args: [],
    );
  }

  /// `Please bring rest of `
  String get FakaMsg {
    return Intl.message(
      'Please bring rest of ',
      name: 'FakaMsg',
      desc: '',
      args: [],
    );
  }

  /// `Contact Info`
  String get ContactInfo {
    return Intl.message(
      'Contact Info',
      name: 'ContactInfo',
      desc: '',
      args: [],
    );
  }

  /// `Top Categories`
  String get TopCategories {
    return Intl.message(
      'Top Categories',
      name: 'TopCategories',
      desc: '',
      args: [],
    );
  }

  /// `All Resturants`
  String get AllResturants {
    return Intl.message(
      'All Resturants',
      name: 'AllResturants',
      desc: '',
      args: [],
    );
  }

  /// `Explore Resturants`
  String get ExploreResturants {
    return Intl.message(
      'Explore Resturants',
      name: 'ExploreResturants',
      desc: '',
      args: [],
    );
  }

  /// `Driver profile`
  String get DriverProfile {
    return Intl.message(
      'Driver profile',
      name: 'DriverProfile',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get OrderDetails {
    return Intl.message(
      'Order Details',
      name: 'OrderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Order Summary`
  String get OrderSummary {
    return Intl.message(
      'Order Summary',
      name: 'OrderSummary',
      desc: '',
      args: [],
    );
  }

  /// `Extras :`
  String get Extras {
    return Intl.message(
      'Extras :',
      name: 'Extras',
      desc: '',
      args: [],
    );
  }

  /// `Optional`
  String get Optional {
    return Intl.message(
      'Optional',
      name: 'Optional',
      desc: '',
      args: [],
    );
  }

  /// `your choice of size :`
  String get ChooseSize {
    return Intl.message(
      'your choice of size :',
      name: 'ChooseSize',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get Required {
    return Intl.message(
      'Required',
      name: 'Required',
      desc: '',
      args: [],
    );
  }

  /// `Choose one`
  String get ChooseOne {
    return Intl.message(
      'Choose one',
      name: 'ChooseOne',
      desc: '',
      args: [],
    );
  }

  /// `Remove your account and all associated data ?`
  String get DeleteAccDialogQ {
    return Intl.message(
      'Remove your account and all associated data ?',
      name: 'DeleteAccDialogQ',
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
