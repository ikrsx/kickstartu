import 'package:kickstartu/data/models/accommodation_api_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AccommodationServices {
  Future<List<AccommodationApiModel>> getAccommodations() async {
    final List<Map<String, dynamic>> responseList = await Supabase
        .instance
        .client
        .from("services")
        .select("*, accommodations(accommodation_type, accommodation_rate)")
        .eq("service_category", "accommodation");

    final Iterable<Future<AccommodationApiModel>> futures = responseList.map(
      (item) async => AccommodationApiModel(
        accommodationId: item["service_id"],
        accommodationThumbnail: await _getThumbnail(item["service_id"]),
        accommodationName: item["service_name"],
        accommodationType: item["accommodations"]["accommodation_type"],
        accommodationRate: item["accommodations"]["accommodation_rate"]
            .toDouble(),
        accommodationRating: item["service_rating"].toDouble(),
      ),
    );

    final resultList = await Future.wait(futures);

    return resultList;
  }

  Future<String> _getThumbnail(String id) async {
    return Supabase.instance.client.storage
        .from("services/$id")
        .getPublicUrl("thumbnail.jpg");
  }
}
