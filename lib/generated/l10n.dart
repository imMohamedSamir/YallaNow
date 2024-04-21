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
