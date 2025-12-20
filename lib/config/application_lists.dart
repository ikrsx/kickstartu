import 'package:flutter/material.dart';
import 'package:kickstartu/ui/accommodation/widgets/accommodation_filter_button.dart';
import 'package:kickstartu/ui/food_service/widgets/food_service_filter_button.dart';
import 'package:kickstartu/ui/shop/widgets/shop_filter_button.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:kickstartu/data/repositories/shop_repositories.dart';
import 'package:kickstartu/data/services/shop_services.dart';
import 'package:kickstartu/ui/faq/widgets/faq_list_view.dart';
import 'package:kickstartu/ui/transport/widgets/transport_list_builder.dart';
import 'package:kickstartu/ui/shop/view_model/shop_view_model.dart';
import 'package:kickstartu/ui/shop/widgets/shop_list_builder.dart';
import 'package:kickstartu/ui/core/view_model/core_view_model.dart';
import 'package:kickstartu/ui/accommodation/widgets/accommodation_list_builder.dart';
import 'package:kickstartu/ui/food_service/widgets/food_service_list_builder.dart';
import 'package:kickstartu/data/repositories/food_service_repositories.dart';
import 'package:kickstartu/data/services/food_service_services.dart';
import 'package:kickstartu/ui/food_service/view_model/food_service_view_model.dart';
import 'package:kickstartu/data/repositories/core_repository.dart';
import 'package:kickstartu/data/services/core_services.dart';
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
      label: "Stayings",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.food_bank_rounded),
      label: "Foods",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_bag_rounded),
      label: "Shops",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bus_alert_rounded),
      label: "Transports",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.question_answer_rounded),
      label: "FAQs",
    ),
  ];

  // List Of List Builders Used In Main Screen's Navigation Bar
  final List<Widget> listViewsList = [
    AccommodationListBuilder(),
    FoodServiceListBuilder(),
    ShopListBuilder(),
    TransportListBuilder(),
    FaqListView(),
  ];

  // List Of FAB Used In Main Screen's Navigation Bar
  final List<Widget> fabList = [
    AccommodationFilterButton(),
    FoodServiceFilterButton(),
    ShopFilterButton(),
    ShopFilterButton(), // TODO: For Transport
    ShopFilterButton(), // TODO: For FAQ
  ];

  // List Of Providers Used In Application
  final List<SingleChildWidget> applicaitionProviders = [
    // Main Screen
    ChangeNotifierProvider(create: (_) => CoreViewModel()),

    // Accommodation
    ChangeNotifierProvider(
      create: (_) => AccommodationViewModel(
        coreRepository: CoreRepository(coreServices: CoreServices()),
        accommodationRepository: AccommodationRepository(
          accommodationServices: AccommodationServices(),
          coreServices: CoreServices(),
        ),
      ),
    ),

    // Food Service
    ChangeNotifierProvider(
      create: (_) => FoodServiceViewModel(
        coreRepository: CoreRepository(coreServices: CoreServices()),
        foodServiceRepository: FoodServiceRepositories(
          foodServiceServices: FoodServiceServices(),
          coreServices: CoreServices(),
        ),
      ),
    ),

    // Shop
    ChangeNotifierProvider(
      create: (_) => ShopViewModel(
        coreRepository: CoreRepository(coreServices: CoreServices()),
        shopRepository: ShopRepositories(
          shopServices: ShopServices(),
          coreServices: CoreServices(),
        ),
      ),
    ),
  ];
}
