import 'package:flutter/material.dart';

class TileTitle extends StatelessWidget {
  const TileTitle({super.key, required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }
}
