import 'package:flutter/material.dart';

// Shop Filter Button Widget
class ShopFilterButton extends StatelessWidget {
  const ShopFilterButton({super.key});

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
              RadioListTile(
                value: "General Store",
                title: Text("General Store"),
              ),
              RadioListTile(value: "Stationary", title: Text("Stationary")),
              RadioListTile(
                value: "Uniform Store",
                title: Text("Uniform Store"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
