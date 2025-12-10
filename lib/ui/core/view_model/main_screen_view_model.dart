import 'package:flutter/material.dart';

class MainScreenViewModel extends ChangeNotifier {
  int _value = 0;

  int get value => _value;

  Future<void> onTap(int currentValue) async {
    _value = currentValue;
    notifyListeners();
  }
}
