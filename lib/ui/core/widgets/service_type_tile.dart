import 'package:flutter/material.dart';

class ServiceTypeTile extends StatelessWidget {
  const ServiceTypeTile({super.key, required this.serviceType});
  final String serviceType;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.category_rounded),
      title: Text(serviceType),
      contentPadding: EdgeInsets.all(0),
    );
  }
}
