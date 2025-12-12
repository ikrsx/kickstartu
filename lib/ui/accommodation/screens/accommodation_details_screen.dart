import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kickstartu/ui/core/core_widgets_exports.dart';
import 'package:kickstartu/ui/accommodation/view_model/accommodation_view_model.dart';

// Accommodation Details Screen Widget
class AccommodationDetailsScreen extends StatelessWidget {
  const AccommodationDetailsScreen({super.key, required this.serviceId});

  final String serviceId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details"), leadingWidth: 26),
      body: _AccommodationDetailsBuilder(serviceId: serviceId),
    );
  }
}

// Fetched Accommodation Details Builder Sub-Widget
class _AccommodationDetailsBuilder extends StatelessWidget {
  const _AccommodationDetailsBuilder({required this.serviceId});

  final String serviceId;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AccommodationViewModel>(context);
    viewModel.getAccommodationDetails(serviceId);

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
        ServiceNameText(serviceName: viewModel.accommodation.name),

        // Accommodation Rating Sub-Widget
        RatingRow(value: viewModel.accommodation.rating),

        // Accommodation Images Carousel Sub-Widget
        ServiceImageCarousel(imageUrls: viewModel.accommodation.imageUrls),

        // Accommodation Description Text Sub-Widget
        ServiceDescriptionText(
          serviceDescription: viewModel.accommodation.description,
        ),

        // Owner Name Tile Sub-Widget
        ServiceOwnerNameTile(ownerName: viewModel.accommodation.ownerName),

        // Owner Contact Tile Sub-Widget
        ServiceOwnerContactTile(
          ownerContact: viewModel.accommodation.ownerContact,
        ),

        // Address Tile Sub-Widget
        ServiceAddressTile(serviceAddress: viewModel.accommodation.address),

        // Landmark Tile Sub-Widget
        ServiceLandmarkTile(serviceLandmark: viewModel.accommodation.landmark),

        // Accommodation Type Tile Sub-Widget
        ServiceTypeTile(serviceType: viewModel.accommodation.accommodationType),

        // Rate Tile Sub-Widget
        _AccommodationRateTile(
          accommodationRate: viewModel.accommodation.accommodationRate,
        ),
      ],
    );
  }
}

// Accommodation Rate Tile Sub-Widget
class _AccommodationRateTile extends StatelessWidget {
  const _AccommodationRateTile({required this.accommodationRate});

  final String accommodationRate;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.currency_rupee_rounded),
      title: Text(accommodationRate),
      contentPadding: EdgeInsets.all(0),
    );
  }
}
