import 'package:kickstartu/domain/service_model.dart';

class FoodServiceModel extends ServiceModel {
  FoodServiceModel({
    required super.id,
    required super.name,
    required super.description,
    required super.imageUrls,
    required super.ownerName,
    required super.ownerContact,
    required super.address,
    required super.landmark,
    required super.rating,
    super.thumbnailUrl = "",
  });
}
