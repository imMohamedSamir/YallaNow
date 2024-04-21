import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('en')); // Set default locale to English

  void changeLanguage(Locale newLocale) {
    emit(newLocale);
  }
}
