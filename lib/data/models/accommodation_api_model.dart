class AccommodationApiModel {
  AccommodationApiModel({
    required this.serviceId,
    required this.serviceName,
    required this.accommodationType,
    required this.accommodationRate,
    required this.serviceRating,
  });

  final String serviceId;
  final String serviceName;
  final String accommodationType;
  final double accommodationRate;
  final double serviceRating;
}
