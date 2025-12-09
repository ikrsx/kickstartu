import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kickstartu/ui/accommodation/view_model/accommodation_view_model.dart';
import 'package:kickstartu/ui/core/widgets/application_error_widget.dart';
import 'package:kickstartu/ui/core/widgets/rating_row.dart';

// Accommodation Details Screen Widget
class AccommodationDetailsScreen extends StatelessWidget {
  const AccommodationDetailsScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details"), leadingWidth: 26),
      body: _AccommodationDetailsBuilder(id: id),
    );
  }
}

// Fetched Accommodation Details Builder Sub-Widget
class _AccommodationDetailsBuilder extends StatelessWidget {
  const _AccommodationDetailsBuilder({required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AccommodationViewModel>(context);
    viewModel.getAccommodationDetails(id);

    if (viewModel.accommodation == null) {
      return Center(child: CircularProgressIndicator());
    }

    if (viewModel.error != null) {
      return ApplicationErrorWidget(errorString: viewModel.error!);
    }

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      children: [
        // Screen Title Sub-Widget
        Text(
          viewModel.accommodation?.name ?? "",
          style: TextStyle(fontSize: 26),
        ),

        // Accommodation Rating Sub-Widget
        RatingRow(value: viewModel.accommodation?.rating ?? ""),
        SizedBox(height: 5),

        // Accommodation Description Text Sub-Widget
        Text(
          viewModel.accommodation?.description ?? "",
          style: TextStyle(fontSize: 14),
        ),

        // Owner Name Tile Sub-Widget
        ListTile(
          leading: Icon(Icons.person_rounded),
          title: Text(viewModel.accommodation?.ownerName ?? ""),
          contentPadding: EdgeInsets.all(0),
        ),

        // Owner Contact Tile Sub-Widget
        ListTile(
          leading: Icon(Icons.phone_rounded),
          title: Text(viewModel.accommodation?.ownerContact ?? ""),
          contentPadding: EdgeInsets.all(0),
          onTap: () {},
        ),

        // Accommodation Type Tile Sub-Widget
        ListTile(
          leading: Icon(Icons.category_rounded),
          title: Text(viewModel.accommodation?.accommodationType ?? ""),
          contentPadding: EdgeInsets.all(0),
        ),

        // Address Tile Sub-Widget
        ListTile(
          leading: Icon(Icons.pin_drop_rounded),
          title: Text(viewModel.accommodation?.address ?? ""),
          contentPadding: EdgeInsets.all(0),
          onTap: () {},
        ),

        // Landmark Tile Sub-Widget
        ListTile(
          leading: Icon(Icons.flag_rounded),
          title: Text(viewModel.accommodation?.landmark ?? ""),
          contentPadding: EdgeInsets.all(0),
        ),

        // Rate Tile Sub-Widget
        ListTile(
          leading: Icon(Icons.currency_rupee_rounded),
          title: Text(viewModel.accommodation?.accommodationRate ?? ""),
          contentPadding: EdgeInsets.all(0),
        ),
      ],
    );
  }
}
