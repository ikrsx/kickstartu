import 'package:flutter/material.dart';

// Main Network Image Widget
class ApplicationNetworkImage extends StatelessWidget {
  const ApplicationNetworkImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) => _ErrorImageContainer(),
      cacheWidth: 1280,
      cacheHeight: 720,
    );
  }
}

// Error Image Container Sub-Widget
class _ErrorImageContainer extends StatelessWidget {
  const _ErrorImageContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      alignment: Alignment.center,
      child: Icon(Icons.image_not_supported, size: 66),
    );
  }
}
