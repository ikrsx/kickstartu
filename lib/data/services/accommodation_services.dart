import 'package:supabase_flutter/supabase_flutter.dart';

class AccommodationServices {
  // Fetch List Of All Accommodations From Services Table
  Future<List<Map<String, dynamic>>> getAccommodationServices() async {
    try {
      return await Supabase.instance.client
          .from("services")
          .select()
          .eq("service_category", "accommodation");
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }

  // Fetch Accommodation's Address From Addresses Table
  Future<String> getAccommodationAddress(String id) async {
    try {
      final address = await Supabase.instance.client
          .from("addresses")
          .select("building_number, street_name, city, state, zip_code")
          .eq("address_id", id)
          .maybeSingle();

      return "${address!["building_number"]}, ${address["street_name"]},${address["city"]},${address["state"]},${address["zip_code"]}";
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }

  // Fetch Accommodation's Thumbnail From Storage
  Future<String> getAccommodationThumbnail(String id) async {
    try {
      final response = await Supabase.instance.client.storage
          .from("services")
          .list(path: "$id/");

      return Supabase.instance.client.storage
          .from("services/$id")
          .getPublicUrl(response.first.name);
    } on StorageException catch (e) {
      throw Exception(e.message);
    }
  }

  // Fetch Accommodation's Name From Services Table
  Future<String> getAccommodationName(String id) async {
    try {
      final response = await Supabase.instance.client
          .from("services")
          .select("service_name")
          .eq("service_id", id)
          .maybeSingle();
      return response!["service_name"];
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }

  // Fetch Accommodation's Description From Services Table
  Future<String> getAccommodationDescription(String id) async {
    try {
      final response = await Supabase.instance.client
          .from("services")
          .select("service_description")
          .eq("service_id", id)
          .maybeSingle();
      return response!["service_description"];
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }

  // Fetch Accommodation's Rating From Services Table
  Future<String> getAccommodationRating(String id) async {
    try {
      final response = await Supabase.instance.client
          .from("services")
          .select("service_rating")
          .eq("service_id", id)
          .maybeSingle();

      return response!["service_rating"].toString();
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }

  // Fetch Accommodation's Type From Accommodations Table
  Future<String> getAccommodationType(String id) async {
    try {
      final response = await Supabase.instance.client
          .from("accommodations")
          .select("accommodation_type")
          .eq("accommodation_id", id)
          .maybeSingle();

      return response!["accommodation_type"];
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }

  // Fetch Accommodation's Rate From Accommodations Table
  Future<String> getAccommodationRate(String id) async {
    try {
      final response = await Supabase.instance.client
          .from("accommodations")
          .select("accommodation_rate")
          .eq("accommodation_id", id)
          .maybeSingle();

      return response!["accommodation_rate"].toString();
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }

  // Fetch Accommodation's Owner's Name From Owners Table
  Future<String> getAccommodationOwnerName(String id) async {
    try {
      final response = await Supabase.instance.client
          .from("owners")
          .select("owner_name")
          .eq("owner_id", id)
          .maybeSingle();

      return response!["owner_name"];
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }

  // Fetch Accommodation's Owner's From Contacts Table
  Future<String> getAccommodationOwnerContact(String id) async {
    try {
      final response = await Supabase.instance.client
          .from("contacts")
          .select("contact_number")
          .eq("contact_id", id)
          .maybeSingle();

      return response!["contact_number"];
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }

  // Fetch Accommodation's Address Landmark From Addresses Table
  Future<String> getAccommodationLandmark(String id) async {
    try {
      final address = await Supabase.instance.client
          .from("addresses")
          .select("landmark")
          .eq("address_id", id)
          .maybeSingle();

      return address!["landmark"];
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }
}
