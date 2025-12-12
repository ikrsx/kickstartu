import 'package:supabase_flutter/supabase_flutter.dart';

class AccommodationServices {
  // Fetch Accommodation's Type From Accommodations Table
  Future<String> getAccommodationType(String accommodationId) async {
    try {
      final response = await Supabase.instance.client
          .from("accommodations")
          .select("accommodation_type")
          .eq("accommodation_id", accommodationId)
          .maybeSingle();

      if (response == null) return "";

      return response["accommodation_type"];
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception("Error in getting accommodation type: $e");
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
    } catch (e) {
      throw Exception("Error in getting accommodation rate: $e");
    }
  }
}
