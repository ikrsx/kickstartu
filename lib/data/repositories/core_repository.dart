import 'package:kickstartu/data/services/core_services.dart';
import 'package:kickstartu/domain/service_model.dart';

class CoreRepository {
  CoreRepository({required CoreServices coreServices})
    : _coreServices = coreServices;

  final CoreServices _coreServices;

  Future<List<ServiceModel>> buildServiceModelList(String category) async {
    try {
      final listMap = await _coreServices.getServices(category);

      final futures = listMap.map(
        (item) async => ServiceModel(
          id: item["service_id"],
          thumbnailUrl: await _coreServices.getThumbnail(item["service_id"]),
          name: item["service_name"],
          rating: item["service_rating"].toString(),
          address: await _coreServices.getAddress(item["service_id"]),
        ),
      );

      return Future.wait(futures);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
