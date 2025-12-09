class ServiceModel {
  ServiceModel({
    required this.id,
    required this.thumbnail,
    required this.name,
    required this.rating,
    required this.address,
    this.landmark,
    this.description,
    this.images,
  });

  final String id;
  final String thumbnail;
  final String name;
  final String rating;
  final String address;
  final String? landmark;
  final String? description;
  final List<String>? images;
}
