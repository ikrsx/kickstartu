import 'package:flutter/material.dart';
import 'package:kickstartu/ui/core/rating_row.dart';
import 'package:kickstartu/ui/core/thumbnail_viewer.dart';
import 'package:kickstartu/ui/core/tile_sub_title.dart';
import 'package:kickstartu/ui/core/tile_title.dart';

class AccommodationTile extends StatelessWidget {
  const AccommodationTile({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.address,
    required this.rate,
    required this.rating,
    this.onTap,
  });

  final String thumbnail;
  final String title;
  final String address;
  final String rate;
  final String rating;
  final void Function()? onTap;

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
            TileSubTitle(value: address),
            TileSubTitle(value: rate),
            SizedBox(height: 6),
            RatingRow(value: rating),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
