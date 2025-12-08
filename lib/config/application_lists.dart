import 'package:flutter/material.dart';

class ApplicationLists {
  ApplicationLists._();

  static final ApplicationLists _instance = ApplicationLists._();

  static ApplicationLists get instance => _instance;

  final List<BottomNavigationBarItem> navBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business_rounded),
      label: "Accommodations",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.food_bank_rounded),
      label: "Tiffins",
    ),
  ];
}
