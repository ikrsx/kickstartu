import 'package:flutter/material.dart';
import 'package:kickstartu/ui/core/widgets/rating_row.dart';

// Main Service Card List Tile Widget
class ServiceCardTile extends StatelessWidget {
  const ServiceCardTile({
    super.key,
    required this.thumbnailUrl,
    required this.titleString,
    required this.ratingValue,
    required this.addressString,
    this.onTap,
  });

  final String thumbnailUrl;
  final String titleString;
  final String ratingValue;
  final String addressString;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: ListTile(
        onTap: onTap,

        // Title Column = Thumbnail + Title
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _ServiceThumbnail(thumbnailUrl: thumbnailUrl),
            SizedBox(height: 8),
            _ServiceTitleText(titleString: titleString),
          ],
        ),

        // Subtitle Column = Rating + Address
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            RatingRow(value: ratingValue),
            Text(addressString),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

// Card's Thumbnail Sub-Widget
class _ServiceThumbnail extends StatelessWidget {
  const _ServiceThumbnail({required this.thumbnailUrl});

  final String thumbnailUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(8),
      child: Image.network(thumbnailUrl),
    );
  }
}

// Card's Title Sub-Widget
class _ServiceTitleText extends StatelessWidget {
  const _ServiceTitleText({required this.titleString});

  final String titleString;

  @override
  Widget build(BuildContext context) {
    return Text(
      titleString,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
