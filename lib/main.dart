import 'package:flutter/material.dart';
import 'package:kickstartu/core/screens/kick_start_u_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: KickStartUScreen());
  }
}
