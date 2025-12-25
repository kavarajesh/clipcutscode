import 'language_event.dart';

class LanguageState {
  final AppLanguage selectedLanguage;

  LanguageState(this.selectedLanguage);

  LanguageState copyWith({AppLanguage? selectedLanguage}) {
    return LanguageState(selectedLanguage ?? this.selectedLanguage);
  }
}
