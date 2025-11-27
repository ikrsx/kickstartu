import 'package:flutter/material.dart';
import 'package:kickstartu/ui/core/rating_row.dart';
import 'package:kickstartu/ui/core/tile_sub_title.dart';
import 'package:kickstartu/ui/core/tile_title.dart';

class AccommodationListBuilder extends StatelessWidget {
  const AccommodationListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Placeholder(fallbackHeight: 215),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6),
                TileTitle(value: "Name"),
                TileSubTitle(value: "Address"),
                SizedBox(height: 6),
                RatingRow(value: "Rating"),
              ],
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
