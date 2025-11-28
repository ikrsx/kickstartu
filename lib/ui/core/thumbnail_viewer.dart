import 'package:flutter/material.dart';

class ThumbnailViewer extends StatelessWidget {
  const ThumbnailViewer({super.key, required this.thumbnail});

  final String thumbnail;

  @override
  Widget build(BuildContext context) {
    return thumbnail == ''
        ? Placeholder(fallbackHeight: 215)
        : ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8),
            child: Image.network(thumbnail),
          );
  }
}
