import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kickstartu/ui/core/core_widgets_exports.dart';
import 'package:kickstartu/ui/food_service/view_model/food_service_view_model.dart';

class FoodServiceDetailsScreen extends StatelessWidget {
  const FoodServiceDetailsScreen({super.key, required this.serviceId});

  final String serviceId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details"), leadingWidth: 26),
      body: _FoodServiceDetailsBuilder(serviceId: serviceId),
    );
  }
}

// Fetched Food Service Details Builder Sub-Widget
class _FoodServiceDetailsBuilder extends StatelessWidget {
  const _FoodServiceDetailsBuilder({required this.serviceId});

  final String serviceId;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FoodServiceViewModel>(context);
    viewModel.getFoodServiceDetails(serviceId);

    if (viewModel.foodService == null) {
      return Center(child: CircularProgressIndicator());
    }

    if (viewModel.error != null) {
      return ApplicationErrorWidget(errorString: viewModel.error!);
    }

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      children: [
        // Screen Title Sub-Widget
        ServiceNameText(serviceName: viewModel.foodService.name),

        // Food Service Rating Sub-Widget
        RatingRow(value: viewModel.foodService.rating),

        // Food Service Images Carousel Sub-Widget
        ServiceImageCarousel(imageUrls: viewModel.foodService.imageUrls),

        // Food Service Description Text Sub-Widget
        ServiceDescriptionText(
          serviceDescription: viewModel.foodService.description,
        ),

        // Owner Name Tile Sub-Widget
        ServiceOwnerNameTile(ownerName: viewModel.foodService.ownerName),

        // Owner Contact Tile Sub-Widget
        ServiceOwnerContactTile(ownerContact: viewModel.foodService.ownerName),

        // Address Tile Sub-Widget
        ServiceAddressTile(serviceAddress: viewModel.foodService.address),

        // Landmark Tile Sub-Widget
        ServiceLandmarkTile(serviceLandmark: viewModel.foodService.landmark),
      ],
    );
  }
}
