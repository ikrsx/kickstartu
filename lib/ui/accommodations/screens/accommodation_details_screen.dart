import 'package:flutter/material.dart';
import 'package:kickstartu/ui/core/rating_row.dart';
import 'package:kickstartu/ui/core/screen_back_button.dart';
import 'package:kickstartu/ui/core/screen_title.dart';
import 'package:kickstartu/ui/accommodations/widgets/accommodation_title_text.dart';

class AccommodationDetailsScreen extends StatelessWidget {
  const AccommodationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: ScreenBackButton(),
        title: AccommodationTitleText(),
      ),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          ScreenTitle(value: "Accommodation Name"),

          RatingRow(value: "Rating"),

          ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Icon(Icons.person_rounded),
            title: Text("Accommodation Owner Name"),
          ),

          ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Icon(Icons.phone_rounded),
            title: Text("Owner Contact Number"),
            onTap: () {},
          ),

          ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Icon(Icons.category_rounded),
            title: Text("Accommodation Type"),
          ),

          ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Icon(Icons.pin_drop_rounded),
            title: Text("Accommodation Address"),
            onTap: () {},
          ),

          ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Icon(Icons.currency_rupee_rounded),
            title: Text("Accommodation Rate"),
          ),
        ],
      ),
    );
  }
}
