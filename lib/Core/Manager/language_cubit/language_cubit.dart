import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallanow/Core/utlis/functions/NavigationMethod.dart';
import 'package:yallanow/Features/UserPart/splashView/splashView.dart';

class LanguageCubit extends Cubit<Locale> {
  static const String _selectedLanguageKey = 'selected_language';
  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('ar'),
    // Add more supported locales here if needed
  ];

  LanguageCubit() : super(const Locale('en')) {
    _loadSavedLanguage();
  }

  void changeLanguage(BuildContext context, Locale newLocale) {
    if (supportedLocales.contains(newLocale)) {
      emit(newLocale);
      _saveLanguage(newLocale);
      // NavigateToPage.slideFromLeftAndRemove(
      //     context: context, page: const SplashView());
    }
  }

  Future<void> _saveLanguage(Locale locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_selectedLanguageKey, locale.languageCode);
  }

  Future<void> _loadSavedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString(_selectedLanguageKey);
    if (languageCode != null) {
      emit(Locale(languageCode));
    }
  }
}
