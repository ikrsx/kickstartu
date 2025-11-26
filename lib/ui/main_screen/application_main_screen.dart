import 'package:flutter/material.dart';
import 'package:kickstartu/ui/main_screen/application_title_text.dart';

class ApplicationMainScreen extends StatelessWidget {
  const ApplicationMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: ApplicationTitleText()));
  }
}
