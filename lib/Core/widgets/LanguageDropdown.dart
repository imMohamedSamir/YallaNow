import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/Manager/language_cubit/language_cubit.dart';

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({super.key});

  @override
  _LanguageDropdownState createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  String _selectedLanguage = 'English';
  final List<String> _languages = [
    'English',
    'العربية',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: const Icon(Icons.language, color: Colors.black),
          value: _selectedLanguage,
          onChanged: (String? newValue) {
            setState(() {
              _selectedLanguage = newValue!;
              if (_selectedLanguage == 'العربية') {
                BlocProvider.of<LanguageCubit>(context)
                    .changeLanguage(const Locale('ar'));
              } else {
                BlocProvider.of<LanguageCubit>(context)
                    .changeLanguage(const Locale('en'));
              }
            });
          },
          items: _languages.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(value),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
