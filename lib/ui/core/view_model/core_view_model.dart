import 'dart:ui';
import 'package:flutter/material.dart';

class CoreViewModel extends ChangeNotifier {
  int _navBarIndex = 0;
  Brightness? _currentBrightness =
      PlatformDispatcher.instance.platformBrightness;

  int get navBarIndex => _navBarIndex;

  IconData? get currentIcon => _currentBrightness == Brightness.dark
      ? Icons.brightness_2_rounded
      : Icons.brightness_5_rounded;

  ThemeData? get currentTheme => _currentBrightness == Brightness.dark
      ? ThemeData.dark()
      : ThemeData.light();

  // Change The Index When Navbar Icon Is Tapped
  Future<void> onNavbarIconTap(int currentValue) async {
    _navBarIndex = currentValue;
    notifyListeners();
  }

  // Change The Theme When Brightness Icon Is Tapped
  Future<void> onBrightnessIconTap() async {
    _currentBrightness = _currentBrightness == Brightness.dark
        ? Brightness.light
        : Brightness.dark;
    notifyListeners();
  }
}
