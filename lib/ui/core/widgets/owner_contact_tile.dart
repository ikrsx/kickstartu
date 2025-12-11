import 'package:flutter/material.dart';

class ServiceOwnerContactTile extends StatelessWidget {
  const ServiceOwnerContactTile({super.key, required this.ownerContact});

  final String ownerContact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.phone_rounded),
      title: Text(ownerContact),
      contentPadding: EdgeInsets.all(0),
      onTap: () {},
    );
  }
}
