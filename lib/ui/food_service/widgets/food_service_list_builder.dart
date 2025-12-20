import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kickstartu/ui/core/core_widgets_exports.dart';
import 'package:kickstartu/ui/food_service/screens/food_service_details_screen.dart';
import 'package:kickstartu/ui/food_service/view_model/food_service_view_model.dart';

class FoodServiceListBuilder extends StatelessWidget {
  const FoodServiceListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FoodServiceViewModel>(context);
    viewModel.listFoodServices();

    if (viewModel.foodServices.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    if (viewModel.error != null) {
      return ApplicationErrorWidget(errorString: viewModel.error!);
    }

    return GridView.builder(
      itemBuilder: (_, index) => ServiceCardTile(
        // Value Feilds of Fetched Cards
        thumbnailUrl: viewModel.foodServices[index].thumbnailUrl,
        titleString: viewModel.foodServices[index].name,
        ratingValue: viewModel.foodServices[index].rating,
        addressString: viewModel.foodServices[index].address,

        // Open Food Service Details Screen When Tapped On Card
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => FoodServiceDetailsScreen(
              serviceId: viewModel.foodServices[index].id,
            ),
          ),
        ),
      ),
      itemCount: viewModel.foodServices.length,
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.landscape ? 2 : 1,
      ),
    );
  }
}
