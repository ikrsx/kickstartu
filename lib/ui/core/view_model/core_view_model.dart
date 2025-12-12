import 'dart:ui';
import 'package:flutter/material.dart';

class CoreViewModel extends ChangeNotifier {
  int _value = 0;
  Brightness? _currentBrightness =
      PlatformDispatcher.instance.platformBrightness;

  int get value => _value;

  IconData? get currentIcon => _currentBrightness == Brightness.dark
      ? Icons.brightness_2_rounded
      : Icons.brightness_5_rounded;

  ThemeData? get currentTheme => _currentBrightness == Brightness.dark
      ? ThemeData.dark()
      : ThemeData.light();

  Future<void> onNavbarIconTap(int currentValue) async {
    _value = currentValue;
    notifyListeners();
  }

  Future<void> changeTheme() async {
    _currentBrightness = _currentBrightness == Brightness.dark
        ? Brightness.light
        : Brightness.dark;
    notifyListeners();
  }
}
