import 'package:flutter/material.dart';

class FaqListView extends StatelessWidget {
  const FaqListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.construction_rounded, size: 100),
          Text(
            "This Feature Is Under Construction",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
