import 'package:flutter/material.dart';
import 'package:kickstartu/ui/core/widgets/application_network_image.dart';

class ServiceImageCarousel extends StatelessWidget {
  const ServiceImageCarousel({super.key, this.imageUrls});

  final List<String>? imageUrls;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: CarouselView(
        itemExtent: 350,
        itemSnapping: true,
        children: imageUrls!
            .map((item) => ApplicationNetworkImage(imageUrl: item))
            .toList(),
      ),
    );
  }
}
