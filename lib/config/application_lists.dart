import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:kickstartu/data/repositories/accommodation_repository.dart';
import 'package:kickstartu/data/services/accommodation_services.dart';
import 'package:kickstartu/ui/accommodation/view_model/accommodation_view_model.dart';

class ApplicationLists {
  ApplicationLists._();

  static final ApplicationLists _instance = ApplicationLists._();

  static ApplicationLists get instance => _instance;

  // List Of Navigation Bar Items
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

  // List Of Providers Used In Application
  final List<SingleChildWidget> applicaitionProviders = [
    ChangeNotifierProvider(
      create: (_) => AccommodationViewModel(
        AccommodationRepository(AccommodationServices()),
      ),
    ),
  ];
}
