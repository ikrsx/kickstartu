import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kickstartu/ui/core/core_widgets_exports.dart';
import 'package:kickstartu/ui/shop/screens/shop_details_screen.dart';
import 'package:kickstartu/ui/shop/view_model/shop_view_model.dart';

class ShopListBuilder extends StatelessWidget {
  const ShopListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ShopViewModel>(context);
    viewModel.listShops();

    if (viewModel.shops.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    if (viewModel.error != null) {
      return ApplicationErrorWidget(errorString: viewModel.error!);
    }

    return GridView.builder(
      itemBuilder: (_, index) => ServiceCardTile(
        // Value Feilds of Fetched Cards
        thumbnailUrl: viewModel.shops[index].thumbnailUrl,
        titleString: viewModel.shops[index].name,
        ratingValue: viewModel.shops[index].rating,
        addressString: viewModel.shops[index].address,

        // Open Shop Details Screen When Tapped On Card
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) =>
                ShopDetailsScreen(serviceId: viewModel.shops[index].id),
          ),
        ),
      ),
      itemCount: viewModel.shops.length,
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.landscape ? 2 : 1,
      ),
    );
  }
}
