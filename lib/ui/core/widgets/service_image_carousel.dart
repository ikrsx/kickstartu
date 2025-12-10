import 'package:flutter/material.dart';
import 'package:kickstartu/ui/core/widgets/application_network_image.dart';

class ServiceImageCarousel extends StatelessWidget {
  const ServiceImageCarousel({super.key, required this.imageUrls});

  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),

      // Calucate The Height Based On Screen Orentaion
      height: MediaQuery.of(context).orientation == Orientation.landscape
          ? MediaQuery.of(context).size.height * 0.76
          : MediaQuery.of(context).size.height * 0.35,

      // Main Carousel View
      child: CarouselView(
        itemExtent: MediaQuery.of(context).size.width * 0.76,
        itemSnapping: true,
        children: imageUrls.isEmpty
            ? [
                Container(
                  color: Colors.grey[300],
                  alignment: Alignment.center,
                  child: Text("No Images"),
                ),
              ]
            : imageUrls
                  .map((item) => ApplicationNetworkImage(imageUrl: item))
                  .toList(),
      ),
    );
  }
}
