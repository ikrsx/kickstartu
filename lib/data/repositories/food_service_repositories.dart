import 'package:kickstartu/data/services/core_services.dart';
import 'package:kickstartu/data/services/food_service_services.dart';
import 'package:kickstartu/domain/food_service_model.dart';

class FoodServiceRepositories {
  FoodServiceRepositories({
    required CoreServices coreServices,
    required FoodServiceServices foodServiceServices,
  }) : _coreServices = coreServices,
       _foodServiceServices = foodServiceServices;

  final CoreServices _coreServices;
  final FoodServiceServices _foodServiceServices;

  Future<FoodServiceModel> buildFoodServiceModel(String id) async {
    try {
      final futures = await Future.wait([
        _coreServices.getName(id),
        _coreServices.getRating(id),
        _coreServices.getDescription(id),
        _coreServices.getOwnerName(id),
        _coreServices.getOwnerContact(id),
        _coreServices.getAddress(id),
        _coreServices.getAddressLandmark(id),
        _foodServiceServices.getFoodServiceType(id),
      ]);

      return FoodServiceModel(
        id: id,
        name: futures[0],
        rating: futures[1],
        imageUrls: await _coreServices.getImageUrls(id),
        description: futures[2],
        ownerName: futures[3],
        ownerContact: futures[4],
        address: futures[5],
        landmark: futures[6],
        foodServiceType: futures[7],
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
