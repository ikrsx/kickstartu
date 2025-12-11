import 'package:flutter/material.dart';

class ServiceAddressTile extends StatelessWidget {
  const ServiceAddressTile({super.key, required this.serviceAddress});

  final String serviceAddress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.pin_drop_rounded),
      title: Text(serviceAddress),
      contentPadding: EdgeInsets.all(0),
      onTap: () {},
    );
  }
}
