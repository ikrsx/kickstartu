import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:kickstartu/data/services/core_services.dart';

class AccommodationServices with CoreServices {
  // Fetch Accommodation's Type From Accommodations Table
  Future<String> getAccommodationType(String accommodatioId) async {
    try {
      final response = await Supabase.instance.client
          .from("accommodations")
          .select("accommodation_type")
          .eq("accommodation_id", accommodatioId)
          .maybeSingle();

      if (response == null) return "";

      return response["accommodation_type"];
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }

  // Fetch Accommodation's Rate From Accommodations Table
  Future<String> getAccommodationRate(String accommodationId) async {
    try {
      final response = await Supabase.instance.client
          .from("accommodations")
          .select("accommodation_rate")
          .eq("accommodation_id", accommodationId)
          .maybeSingle();

      if (response == null) return "";

      return response["accommodation_rate"].toString();
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }
}
