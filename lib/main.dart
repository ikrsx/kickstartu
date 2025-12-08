import 'package:flutter/material.dart';
import 'package:kickstartu/ui/core/screens/application_main_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ApplicationMainScreen());
  }
}
