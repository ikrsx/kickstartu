import 'package:kickstartu/data/services/accommodation_services.dart';
import 'package:kickstartu/domain/accommodation_model.dart';

class AccommodationRepository {
  AccommodationRepository({required AccommodationServices services})
    : _services = services;

  final AccommodationServices _services;

  Future<List<AccommodationModel>> getAccommodations() async {
    try {
      final accommodations = await _services.getAccommodationServices();

      final futures = accommodations
          .map(
            (item) async => AccommodationModel(
              id: item["service_id"],
              name: item["service_name"],
              rating: item["service_rating"].toString(),
              thumbnail: await _services.getAccommodationThumbnail(
                item["service_id"],
              ),
              address:
                  await _services.getAccommodationAddress(item["service_id"]) ??
                  "N/A",
              rate:
                  await _services.getAccommodationRate(item["service_id"]) ??
                  "N/A",
            ),
          )
          .toList();

      return await Future.wait(futures);
    } catch (e) {
      throw Exception("Failed to load accommodations");
    }
  }
}
