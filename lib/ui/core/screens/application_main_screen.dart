import 'package:flutter/material.dart';
import 'package:kickstartu/config/application_lists.dart';
import 'package:kickstartu/config/application_strings.dart';
import 'package:kickstartu/ui/accommodation/widgets/accommodation_list_builder.dart';

// Main Screen Widget
class ApplicationMainScreen extends StatelessWidget {
  const ApplicationMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _MainScreenAppBarTitle()),
      body: AccommodationListBuilder(),
      bottomNavigationBar: _ApplicationBottomNavigationBar(),
    );
  }
}

// Main Screen's App Bar Title Sub-Widget
class _MainScreenAppBarTitle extends StatelessWidget {
  const _MainScreenAppBarTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      ApplicationStrings.instance.applicationName,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}

// Main Screen's Bottom Navigation Bar Sub-Widget
class _ApplicationBottomNavigationBar extends StatelessWidget {
  const _ApplicationBottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: ApplicationLists.instance.navBarItems,
      elevation: 0,
    );
  }
}
