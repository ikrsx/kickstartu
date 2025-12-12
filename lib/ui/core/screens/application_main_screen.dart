import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kickstartu/config/application_lists.dart';
import 'package:kickstartu/config/application_strings.dart';
import 'package:kickstartu/ui/core/view_model/core_view_model.dart';

// Main Screen Widget
class ApplicationMainScreen extends StatelessWidget {
  const ApplicationMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CoreViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: _MainScreenAppBarTitle(),
        actions: [_ThemeToggleButton(mainScreenViewModel: viewModel)],
      ),
      body: ApplicationLists.instance.buildersList[viewModel.value],
      bottomNavigationBar: _ApplicationBottomNavigationBar(),
    );
  }
}

class _ThemeToggleButton extends StatelessWidget {
  const _ThemeToggleButton({required this.mainScreenViewModel});

  final CoreViewModel mainScreenViewModel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: mainScreenViewModel.changeTheme,
      icon: Icon(mainScreenViewModel.currentIcon),
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
    final viewModel = Provider.of<CoreViewModel>(context);

    return BottomNavigationBar(
      items: ApplicationLists.instance.navBarItems,
      elevation: 0,
      currentIndex: viewModel.value,
      onTap: (value) => viewModel.onNavbarIconTap(value),
    );
  }
}
