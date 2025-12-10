class ServiceModel {
  ServiceModel({
    required this.id,
    required this.thumbnailUrl,
    required this.name,
    required this.rating,
    required this.address,
    this.landmark,
    this.description,
    this.imageUrls,
  });

  final String id;
  final String thumbnailUrl;
  final String name;
  final String rating;
  final String address;
  final String? landmark;
  final String? description;
  final List<String>? imageUrls;
}
