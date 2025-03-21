import 'package:flutter/material.dart';

class ThemeController extends ValueNotifier<bool> {
  ThemeController(): super(false);

  void toggleTheme() {
    value = !value;
  }
}