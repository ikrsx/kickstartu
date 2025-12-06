import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kickstartu/ui/accommodations/screens/accommodation_details_screen.dart';
import 'package:kickstartu/ui/accommodations/view_model/accommodation_view_model.dart';
import 'package:kickstartu/ui/accommodations/widgets/accommodation_tile.dart';

class AccommodationListBuilder extends StatelessWidget {
  const AccommodationListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AccommodationViewModel>(context);
    viewModel.listAccommodations();

    if (viewModel.isLoading) return Center(child: CircularProgressIndicator());

    if (viewModel.error != null) return Center(child: Text(viewModel.error!));

    return ListView.builder(
      itemCount: viewModel.accommodations.length,
      itemBuilder: (context, index) {
        return AccommodationTile(
          title: viewModel.accommodations[index].name,
          thumbnail: viewModel.accommodations[index].thumbnail,
          rate: viewModel.accommodations[index].rate,
          rating: viewModel.accommodations[index].rating,
          address: viewModel.accommodations[index].address,
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AccommodationDetailsScreen(),
            ),
          ),
        );
      },
    );
  }
}
