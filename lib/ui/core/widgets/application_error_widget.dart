import 'package:flutter/material.dart';

class ApplicationErrorWidget extends StatelessWidget {
  const ApplicationErrorWidget({super.key, required this.errorString});

  final String errorString;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Error Icon Sub-Widget
          Icon(Icons.error_rounded, size: 152),

          // Error Text Sub-Widget
          Text(
            errorString,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
