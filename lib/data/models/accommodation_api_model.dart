class AccommodationApiModel {
  AccommodationApiModel({
    required this.accommodationId,
    required this.accommodationThumbnail,
    required this.accommodationName,
    required this.accommodationType,
    required this.accommodationRate,
    required this.accommodationRating,
  });

  final String accommodationId;
  final String accommodationThumbnail;
  final String accommodationName;
  final String accommodationType;
  final double accommodationRate;
  final double accommodationRating;
}
