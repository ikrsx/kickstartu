import 'package:kickstartu/data/services/accommodation_services.dart';
import 'package:kickstartu/data/services/core_services.dart';
import 'package:kickstartu/domain/accommodation_model.dart';

class AccommodationRepository {
  AccommodationRepository({
    required AccommodationServices accommodationServices,
    required CoreServices coreServices,
  }) : _accommodationServices = accommodationServices,
       _coreServices = coreServices;

  final AccommodationServices _accommodationServices;
  final CoreServices _coreServices;

  // Build Accommodation Model From Accommodation Services
  Future<AccommodationModel> buildAccommodationModel(String id) async {
    try {
      final futures = await Future.wait([
        _coreServices.getName(id),
        _coreServices.getRating(id),
        _coreServices.getDescription(id),
        _coreServices.getOwnerName(id),
        _coreServices.getOwnerContact(id),
        _accommodationServices.getAccommodationType(id),
        _coreServices.getAddress(id),
        _coreServices.getAddressLandmark(id),
        _accommodationServices.getAccommodationRate(id),
      ]);

      return AccommodationModel(
        id: id,
        name: futures[0],
        rating: futures[1],
        imageUrls: await _coreServices.getImageUrls(id),
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
