import 'package:flutter/material.dart';

class ServiceNameText extends StatelessWidget {
  const ServiceNameText({super.key, required this.serviceName});

  final String serviceName;

  @override
  Widget build(BuildContext context) {
    return Text(serviceName, style: TextStyle(fontSize: 26));
  }
}
