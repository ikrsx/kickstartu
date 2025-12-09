import 'package:kickstartu/domain/service_model.dart';

class AccommodationModel extends ServiceModel {
  AccommodationModel({
    required super.id,
    required super.name,
    required super.address,
    required super.rating,
    required super.landmark,
    required super.description,
    required super.images,
    required this.ownerName,
    required this.ownerContact,
    required this.accommodationType,
    required this.accommodationRate,
    super.thumbnail = "",
  });

  final String ownerName;
  final String ownerContact;
  final String accommodationType;
  final String accommodationRate;
}
