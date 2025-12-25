
import 'package:flutter/material.dart';

enum AppLanguage { english, hindi }


abstract class LanguageEvent {}

class SelectLanguageEvent extends LanguageEvent {
  final AppLanguage language;
  SelectLanguageEvent(this.language);
}

class ApplyLanguageEvent extends LanguageEvent {
  final BuildContext context;
  ApplyLanguageEvent(this.context);
}
