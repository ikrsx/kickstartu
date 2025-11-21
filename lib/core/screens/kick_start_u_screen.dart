import 'package:flutter/material.dart';
import 'package:kickstartu/core/widgets/app_bar_title.dart';
import 'package:kickstartu/features/accommodation/widgets/accommodation_listing.dart';

class KickStartUScreen extends StatelessWidget {
  const KickStartUScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppBarTitle()),
      body: AccommodationListing(),
    );
  }
}
