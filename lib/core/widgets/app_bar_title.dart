import 'package:flutter/material.dart';
import 'package:kickstartu/config/constants.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      StringConstants.applicationName,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
