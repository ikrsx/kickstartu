import 'package:kickstartu/data/services/accommodation_services.dart';
import 'package:kickstartu/domain/accommodation_model.dart';
import 'package:kickstartu/domain/service_model.dart';

class AccommodationRepository {
  AccommodationRepository(AccommodationServices services)
    : _services = services;

  final AccommodationServices _services;

  // Build List Of Accommodation Model From Accommodation Services
  Future<List<ServiceModel>> buildAccommodationModelList() async {
    try {
      final accommodationListMap = await _services.getAccommodationServices();

      final futures = accommodationListMap.map(
        (item) async => ServiceModel(
          id: item["service_id"],
          thumbnail: await _services.getAccommodationThumnail(
            item["service_id"],
          ),
          name: item["service_name"],
          rating: item["service_rating"].toString(),
          address: await _services.getAccommodationAddress(item["service_id"]),
        ),
      );

      return Future.wait(futures);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Build Accommodation Model From Accommodation Services
  Future<AccommodationModel> buildAccommodationModel(String id) async {
    try {
      final futures = await Future.wait([
        _services.getAccommodationName(id),
        _services.getAccommodationRating(id),
        _services.getAccommodationOwnerName(id),
        _services.getAccommodationOwnerContact(id),
        _services.getAccommodationType(id),
        _services.getAccommodationAddress(id),
        _services.getAccommodationLandmark(id),
        _services.getAccommodationRate(id),
      ]);

      return AccommodationModel(
        id: id,
        name: futures[0],
        rating: futures[1],
        ownerName: futures[2],
        ownerContact: futures[3],
        accommodationType: futures[4],
        address: futures[5],
        landmark: futures[6],
        accommodationRate: futures[7],
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
