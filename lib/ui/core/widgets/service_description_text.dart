import 'package:flutter/material.dart';

class ServiceDescriptionText extends StatelessWidget {
  const ServiceDescriptionText({super.key, required this.serviceDescription});

  final String serviceDescription;

  @override
  Widget build(BuildContext context) {
    return Text(serviceDescription, style: TextStyle(fontSize: 14));
  }
}
