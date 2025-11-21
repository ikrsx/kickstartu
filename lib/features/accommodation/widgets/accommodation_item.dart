/* 
  TODO: 
  * ADD IMAGE SUPPORT
  * ADD ON TAP FUNCTIONALITY
*/
import 'package:flutter/material.dart';

class AccommodationItem extends StatelessWidget {
  const AccommodationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AccommodationItemImage(),
      subtitle: AccommodationItemDetails(),
      onTap: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
    );
  }
}

class AccommodationItemImage extends StatelessWidget {
  const AccommodationItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Placeholder(fallbackHeight: 215),
    );
  }
}

class AccommodationItemDetails extends StatelessWidget {
  const AccommodationItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Name",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 17),
                Text("Rating"),
              ],
            ),
          ],
        ),
        Text("Location"),
      ],
    );
  }
}
