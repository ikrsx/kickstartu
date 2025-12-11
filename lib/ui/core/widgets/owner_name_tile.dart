import 'package:flutter/material.dart';

class ServiceOwnerNameTile extends StatelessWidget {
  const ServiceOwnerNameTile({super.key, required this.ownerName});

  final String ownerName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person_rounded),
      title: Text(ownerName),
      contentPadding: EdgeInsets.all(0),
    );
  }
}
