import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kickstartu/ui/core/core_widgets_exports.dart';
import 'package:kickstartu/ui/accommodation/view_model/accommodation_view_model.dart';
import 'package:kickstartu/ui/accommodation/screens/accommodation_details_screen.dart';

class AccommodationListBuilder extends StatelessWidget {
  const AccommodationListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AccommodationViewModel>(context);
    viewModel.listAccommodations();

    if (viewModel.accommodations.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    if (viewModel.error != null) {
      return ApplicationErrorWidget(errorString: viewModel.error!);
    }

    return GridView.builder(
      itemBuilder: (_, index) => ServiceCardTile(
        // Value Feilds of Fetched Cards
        thumbnailUrl: viewModel.accommodations[index].thumbnailUrl,
        titleString: viewModel.accommodations[index].name,
        ratingValue: viewModel.accommodations[index].rating,
        addressString: viewModel.accommodations[index].address,

        // Open Details Screen When Tapped On A Card
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => AccommodationDetailsScreen(
              serviceId: viewModel.accommodations[index].id,
            ),
          ),
        ),
      ),
      itemCount: viewModel.accommodations.length,
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.landscape ? 2 : 1,
      ),
    );
  }
}
