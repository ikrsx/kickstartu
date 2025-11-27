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

    final List<AccommodationApiModel> resultList = [];

    for (var item in responseList) {
      resultList.add(
        AccommodationApiModel(
          serviceId: item["service_id"],
          serviceName: item["service_name"],
          accommodationType: item["accommodations"]["accommodation_type"],
          accommodationRate: item["accommodations"]["accommodation_rate"]
              .toDouble(),
          serviceRating: item["service_rating"].toDouble(),
        ),
      );
    }

    return resultList;
  }
}
