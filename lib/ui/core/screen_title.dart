import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({super.key, required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(value, style: TextStyle(fontSize: 24));
  }
}
