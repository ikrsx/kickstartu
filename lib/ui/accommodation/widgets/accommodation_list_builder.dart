import 'package:flutter/material.dart';
import 'package:kickstartu/ui/accommodation/screens/accommodation_details_screen.dart';
import 'package:kickstartu/ui/core/widgets/service_card_tile.dart';

class AccommodationListBuilder extends StatelessWidget {
  const AccommodationListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ServiceCardTile(
        // Values of Fetched Cards
        thumbnailUrl: "Url",
        titleString: "Service Title",
        ratingValue: "Rating",
        addressString: "Service Address",

        // Open Details Screen When Tapped On A Card
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AccommodationDetailsScreen()),
        ),
      ),
      itemCount: 1,
      padding: EdgeInsets.all(8),
    );
  }
}
