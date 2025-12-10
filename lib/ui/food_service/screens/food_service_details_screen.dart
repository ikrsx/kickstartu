import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kickstartu/ui/core/widgets/application_error_widget.dart';
import 'package:kickstartu/ui/core/widgets/rating_row.dart';
import 'package:kickstartu/ui/core/widgets/service_image_carousel.dart';
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

// Fetched Accommodation Details Builder Sub-Widget
class _FoodServiceDetailsBuilder extends StatelessWidget {
  const _FoodServiceDetailsBuilder({required this.serviceId});

  final String serviceId;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FoodServiceViewModel>(context);
    viewModel.getAccommodationDetails(serviceId);

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
        Text(viewModel.foodService.name, style: TextStyle(fontSize: 26)),

        // Accommodation Rating Sub-Widget
        RatingRow(value: viewModel.foodService.rating),

        // Accommodation Images Carousel Sub-Widget
        ServiceImageCarousel(imageUrls: viewModel.foodService.imageUrls),

        // Accommodation Description Text Sub-Widget
        Text(viewModel.foodService.description, style: TextStyle(fontSize: 14)),

        // Owner Name Tile Sub-Widget
        ListTile(
          leading: Icon(Icons.person_rounded),
          title: Text(viewModel.foodService.ownerName),
          contentPadding: EdgeInsets.all(0),
        ),

        // Owner Contact Tile Sub-Widget
        ListTile(
          leading: Icon(Icons.phone_rounded),
          title: Text(viewModel.foodService.ownerContact),
          contentPadding: EdgeInsets.all(0),
          onTap: () {},
        ),

        // Address Tile Sub-Widget
        ListTile(
          leading: Icon(Icons.pin_drop_rounded),
          title: Text(viewModel.foodService.address),
          contentPadding: EdgeInsets.all(0),
          onTap: () {},
        ),

        // Landmark Tile Sub-Widget
        ListTile(
          leading: Icon(Icons.flag_rounded),
          title: Text(viewModel.foodService.landmark),
          contentPadding: EdgeInsets.all(0),
        ),
      ],
    );
  }
}
