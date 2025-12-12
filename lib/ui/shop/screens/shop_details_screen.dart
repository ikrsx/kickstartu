import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kickstartu/ui/shop/view_model/shop_view_model.dart';
import 'package:kickstartu/ui/core/core_widgets_exports.dart';

class ShopDetailsScreen extends StatelessWidget {
  const ShopDetailsScreen({super.key, required this.serviceId});

  final String serviceId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details"), leadingWidth: 26),
      body: _ShopDetailsBuilder(serviceId: serviceId),
    );
  }
}

// Fetched Shop Details Builder Sub-Widget
class _ShopDetailsBuilder extends StatelessWidget {
  const _ShopDetailsBuilder({required this.serviceId});

  final String serviceId;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ShopViewModel>(context);
    viewModel.getShopDetails(serviceId);

    if (viewModel.shop == null) {
      return Center(child: CircularProgressIndicator());
    }

    if (viewModel.error != null) {
      return ApplicationErrorWidget(errorString: viewModel.error!);
    }

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      children: [
        // Screen Title Sub-Widget
        ServiceNameText(serviceName: viewModel.shop.name),

        // Shop Rating Sub-Widget
        RatingRow(value: viewModel.shop.rating),

        // Shop Images Carousel Sub-Widget
        ServiceImageCarousel(imageUrls: viewModel.shop.imageUrls),

        // Shop Description Text Sub-Widget
        ServiceDescriptionText(serviceDescription: viewModel.shop.description),

        // Owner Name Tile Sub-Widget
        ServiceOwnerNameTile(ownerName: viewModel.shop.ownerName),

        // Owner Contact Tile Sub-Widget
        ServiceOwnerContactTile(ownerContact: viewModel.shop.ownerContact),

        // Address Tile Sub-Widget
        ServiceAddressTile(serviceAddress: viewModel.shop.address),

        // Landmark Tile Sub-Widget
        ServiceLandmarkTile(serviceLandmark: viewModel.shop.landmark),
      ],
    );
  }
}
