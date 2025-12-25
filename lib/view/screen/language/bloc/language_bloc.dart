import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'language_event.dart';
import 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState(AppLanguage.english)) {
    on<SelectLanguageEvent>((event, emit) {
      emit(state.copyWith(selectedLanguage: event.language));
    });

    on<ApplyLanguageEvent>((event, emit) async {
      if (state.selectedLanguage == AppLanguage.english) {
        await event.context.setLocale(const Locale('en'));
      } else {
        await event.context.setLocale(const Locale('hi'));
      }
    });
  }
}
