import 'package:kickstartu/domain/service_model.dart';

class AccommodationModel extends ServiceModel {
  AccommodationModel({
    required super.id,
    required super.name,
    required super.address,
    required super.rating,
    required super.landmark,
    required super.description,
    required super.imageUrls,
    required super.ownerName,
    required super.ownerContact,
    required this.accommodationType,
    required this.accommodationRate,
    super.thumbnailUrl = "",
  });

  final String accommodationType;
  final String accommodationRate;
}
