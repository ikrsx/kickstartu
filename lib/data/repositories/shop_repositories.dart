import 'package:kickstartu/data/services/core_services.dart';
import 'package:kickstartu/data/services/shop_services.dart';
import 'package:kickstartu/domain/shop_model.dart';

class ShopRepositories {
  ShopRepositories({
    required CoreServices coreServices,
    required ShopServices shopServices,
  }) : _coreServices = coreServices,
       _shopServices = shopServices;

  final CoreServices _coreServices;

  // ignore: unused_field
  final ShopServices _shopServices;

  Future<ShopModel> buildShopModel(String shopId) async {
    try {
      final futures = await Future.wait([
        _coreServices.getName(shopId),
        _coreServices.getRating(shopId),
        _coreServices.getDescription(shopId),
        _coreServices.getOwnerName(shopId),
        _coreServices.getOwnerContact(shopId),
        _coreServices.getAddress(shopId),
        _coreServices.getAddressLandmark(shopId),
      ]);

      return ShopModel(
        id: shopId,
        name: futures[0],
        rating: futures[1],
        imageUrls: await _coreServices.getImageUrls(shopId),
        description: futures[2],
        ownerName: futures[3],
        ownerContact: futures[4],
        address: futures[5],
        landmark: futures[6],
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
