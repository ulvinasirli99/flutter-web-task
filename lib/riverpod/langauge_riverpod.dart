import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageNotifer extends StateNotifier<Locale> {
  LanguageNotifer(super.state);

  set value(Locale? locale) => state = locale ?? Locale('en');
}

final langNotifer = StateNotifierProvider<LanguageNotifer, Locale>(
    (ref) => LanguageNotifer(Locale('en')));
