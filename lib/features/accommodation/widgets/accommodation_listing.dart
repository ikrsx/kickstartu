import 'package:flutter/material.dart';
import 'package:kickstartu/features/accommodation/widgets/accommodation_item.dart';

class AccommodationListing extends StatelessWidget {
  const AccommodationListing({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => AccommodationItem(),
      itemCount: 10,
      padding: EdgeInsets.symmetric(horizontal: 12),
    );
  }
}
