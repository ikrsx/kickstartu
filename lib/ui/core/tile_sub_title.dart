import 'package:flutter/material.dart';

class TileSubTitle extends StatelessWidget {
  const TileSubTitle({super.key, required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(value, style: TextStyle(fontSize: 14));
  }
}
