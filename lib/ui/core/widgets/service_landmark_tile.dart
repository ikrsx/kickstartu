import 'package:flutter/material.dart';

class ServiceLandmarkTile extends StatelessWidget {
  const ServiceLandmarkTile({super.key, required this.serviceLandmark});

  final String serviceLandmark;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.flag_rounded),
      title: Text(serviceLandmark),
      contentPadding: EdgeInsets.all(0),
    );
  }
}
