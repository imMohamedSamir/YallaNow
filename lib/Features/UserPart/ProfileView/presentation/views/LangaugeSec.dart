import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallanow/Core/Manager/language_cubit/language_cubit.dart';
import 'package:yallanow/Features/UserPart/ProfileView/presentation/views/LanguageRadioLT.dart';

class LangaugeSec extends StatefulWidget {
  const LangaugeSec({
    super.key,
  });

  @override
  State<LangaugeSec> createState() => _LangaugeSecState();
}

class _LangaugeSecState extends State<LangaugeSec> {
  String? groupValue;
  @override
  void initState() {
    // TODO: implement initState
    final locale = context.read<LanguageCubit>().state;
    groupValue = locale.languageCode == 'en' ? 'English' : 'Arabic';
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LanguageRadioLT(
          title: "English (US)",
          groupValue: groupValue,
          value: 'English',
          onChanged: (String? value) {
            setState(() {
              groupValue = value; // Update groupValue when user selects English
              // Change locale to English
              BlocProvider.of<LanguageCubit>(context)
                  .changeLanguage(context, const Locale('en'));
            });
          },
        ),
        BlocBuilder<LanguageCubit, Locale>(
          builder: (context, state) {
            return LanguageRadioLT(
              groupValue: groupValue,
              value: "Arabic",
              onChanged: (String? value) {
                setState(() {
                  groupValue = value;
                  BlocProvider.of<LanguageCubit>(context)
                      .changeLanguage(context, const Locale('ar'));
                });
              },
              title: state.languageCode == 'en' ? 'Arabic' : 'العربية',
            );
          },
        )
      ],
    );
  }
}
