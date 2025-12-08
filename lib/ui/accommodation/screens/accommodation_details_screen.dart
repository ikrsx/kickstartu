import 'package:flutter/material.dart';
import 'package:kickstartu/ui/core/widgets/rating_row.dart';

class AccommodationDetailsScreen extends StatelessWidget {
  const AccommodationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details"), leadingWidth: 26),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          // Screen Title Sub-Widget
          Text("Accommodation Title", style: TextStyle(fontSize: 26)),

          // Accommodation Rating Sub-Widget
          RatingRow(value: "Rating Value"),

          // Owner Name Tile Sub-Widget
          ListTile(
            leading: Icon(Icons.person_rounded),
            title: Text("Owner Name"),
            contentPadding: EdgeInsets.all(0),
          ),

          // Owner Contact Tile Sub-Widget
          ListTile(
            leading: Icon(Icons.phone_rounded),
            title: Text("Owner Contact Number"),
            contentPadding: EdgeInsets.all(0),
            onTap: () {},
          ),

          // Accommodation Type Tile Sub-Widget
          ListTile(
            leading: Icon(Icons.category_rounded),
            title: Text("Accommodation Type"),
            contentPadding: EdgeInsets.all(0),
          ),

          // Address Tile Sub-Widget
          ListTile(
            leading: Icon(Icons.pin_drop_rounded),
            title: Text("Accommodation Address"),
            contentPadding: EdgeInsets.all(0),
            onTap: () {},
          ),

          // Rate Tile Sub-Widget
          ListTile(
            leading: Icon(Icons.currency_rupee_rounded),
            title: Text("Accommodation Rate"),
            contentPadding: EdgeInsets.all(0),
          ),
        ],
      ),
    );
  }
}
