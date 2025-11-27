import 'package:kickstartu/data/services/accommodation_services.dart';
import 'package:kickstartu/domain/accommodation_model.dart';

class AccommodationRepository {
  AccommodationRepository({required AccommodationServices services})
    : _services = services;

  final AccommodationServices _services;

  Future<List<AccommodationModel>> getAccommodations() async {
    List<AccommodationModel> accommodationList = [];

    final accommodations = await _services.getAccommodations();

    for (var item in accommodations) {
      accommodationList.add(
        AccommodationModel(
          id: item.serviceId,
          name: item.serviceName,
          type: item.accommodationType,
          rate: item.accommodationRate,
          rating: item.serviceRating,
        ),
      );
    }

    return accommodationList;
  }
}
