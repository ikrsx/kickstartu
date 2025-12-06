import 'package:supabase_flutter/supabase_flutter.dart';

class AccommodationServices {
  Future<List<Map<String, dynamic>>> getAccommodationServices() async {
    try {
      final response = await Supabase.instance.client
          .from("services")
          .select()
          .eq("service_category", "accommodation");

      return response.toList();
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<String?> getAccommodationAddress(String id) async {
    try {
      final response = await Supabase.instance.client
          .from("addresses")
          .select("building_number, street_name, city, state, zip_code")
          .eq("address_id", id)
          .maybeSingle();

      if (response == null) return null;

      return "${response["building_number"]}, ${response["street_name"]}, ${response["city"]}, ${response["state"]}, ${response["zip_code"]}";
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<String> getAccommodationThumbnail(String id) async {
    try {
      return Supabase.instance.client.storage
          .from("services/$id")
          .getPublicUrl("thumbnail.jpg");
    } on StorageException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<String?> getAccommodationRate(String id) async {
    try {
      final response = await Supabase.instance.client
          .from("accommodations")
          .select("accommodation_rate")
          .eq("accommodation_id", id)
          .maybeSingle();

      if (response == null) return null;

      return response["accommodation_rate"].toString();
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<String?> getAccommodationType(String id) async {
    try {
      final response = await Supabase.instance.client
          .from("accommodations")
          .select("accommodation_type")
          .eq("accommodation_id", id)
          .maybeSingle();

      if (response == null) return null;

      return response["accommodation_type"];
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<String?> getAccommodationOwnerName(String id) async {
    try {
      final response = await Supabase.instance.client
          .from("owners")
          .select("owner_name")
          .eq("owner_id", id)
          .maybeSingle();

      if (response == null) return null;

      return response["owner_name"];
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<String?> getAccommodationOwnerContact(String id) async {
    try {
      final response = await Supabase.instance.client
          .from("contacts")
          .select("contact_number")
          .eq("contact_id", id)
          .maybeSingle();

      if (response == null) return null;

      return response["contact_number"];
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }
}
