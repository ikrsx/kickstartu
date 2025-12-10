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
      final accommodationListMap = await _services.getServices("accommodation");

      final futures = accommodationListMap.map(
        (item) async => ServiceModel(
          id: item["service_id"],
          thumbnailUrl: await _services.getServiceThumbnail(item["service_id"]),
          name: item["service_name"],
          rating: item["service_rating"].toString(),
          address: await _services.getServiceAddress(item["service_id"]),
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
        _services.getServiceName(id),
        _services.getServiceRating(id),
        _services.getServiceDescription(id),
        _services.getOwnerName(id),
        _services.getOwnerContact(id),
        _services.getAccommodationType(id),
        _services.getServiceAddress(id),
        _services.getServiceLandmark(id),
        _services.getAccommodationRate(id),
      ]);

      return AccommodationModel(
        id: id,
        name: futures[0],
        rating: futures[1],
        imageUrls: await _services.getServiceImageUrls(id),
        description: futures[2],
        ownerName: futures[3],
        ownerContact: futures[4],
        accommodationType: futures[5],
        address: futures[6],
        landmark: futures[7],
        accommodationRate: futures[8],
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
