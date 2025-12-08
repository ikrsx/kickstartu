import 'package:flutter/material.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({super.key, required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(children: [Icon(Icons.star_rounded, size: 12), Text(value)]);
  }
}
