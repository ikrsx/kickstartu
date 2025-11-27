import 'package:flutter/material.dart';
import 'package:kickstartu/config/application_strings.dart';

class ApplicationTitleText extends StatelessWidget {
  const ApplicationTitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      ApplicationStrings.instance.applicationName,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
