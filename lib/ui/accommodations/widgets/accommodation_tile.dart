import 'package:flutter/material.dart';
import 'package:kickstartu/ui/core/rating_row.dart';
import 'package:kickstartu/ui/core/thumbnail_viewer.dart';
import 'package:kickstartu/ui/core/tile_sub_title.dart';
import 'package:kickstartu/ui/core/tile_title.dart';

class AccommodationTile extends StatelessWidget {
  const AccommodationTile({
    super.key,
    required this.title,
    required this.thumbnail,
    required this.rateValue,
    required this.ratingValue,
  });

  final String title;
  final String thumbnail;
  final String rateValue;
  final String ratingValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: ThumbnailViewer(thumbnail: thumbnail),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 6),
            TileTitle(value: title),
            TileSubTitle(value: "Address"),
            TileSubTitle(value: rateValue),
            SizedBox(height: 6),
            RatingRow(value: ratingValue),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
