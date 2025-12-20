import 'package:flutter/material.dart';

// Accommodation Filter Button Widget
class AccommodationFilterButton extends StatelessWidget {
  const AccommodationFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () =>
          showDialog(context: context, builder: (context) => _FilterDialog()),
      child: Icon(Icons.filter_alt_rounded),
    );
  }
}

class _FilterDialog extends StatelessWidget {
  const _FilterDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Filter By", style: TextStyle(fontSize: 22)),
      actionsPadding: EdgeInsets.all(0),
      actions: [
        RadioGroup(
          onChanged: (value) {},
          child: Column(
            children: [
              RadioListTile(value: "None", title: Text("None")),
              RadioListTile(value: "Boys Hostel", title: Text("Boys Hostel")),
              RadioListTile(value: "Girls PG", title: Text("Girls PG")),
            ],
          ),
        ),
      ],
    );
  }
}
