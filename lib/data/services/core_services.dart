import 'package:supabase_flutter/supabase_flutter.dart';

mixin CoreServices {
  // Fetch List Of All Service Category From Services Table
  Future<List<Map<String, dynamic>>> getServices(String category) async {
    try {
      return await Supabase.instance.client
          .from("services")
          .select()
          .eq("service_category", category);
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }

  // Fetch Service's Address From Addresses Table
  Future<String> getServiceAddress(String serviceId) async {
    try {
      final address = await Supabase.instance.client
          .from("addresses")
          .select("building_number, street_name, city, state, zip_code")
          .eq("address_id", serviceId)
          .maybeSingle();

      if (address == null) return "";

      return "${address["building_number"]}, ${address["street_name"]},${address["city"]},${address["state"]},${address["zip_code"]}";
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }

  // Fetch Service's Address Landmark From Addresses Table
  Future<String> getServiceLandmark(String serviceId) async {
    try {
      final address = await Supabase.instance.client
          .from("addresses")
          .select("landmark")
          .eq("address_id", serviceId)
          .maybeSingle();

      if (address == null) return "";

      return address["landmark"];
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }

  // Fetch Owner's Name From Owners Table
  Future<String> getOwnerName(String serviceId) async {
    try {
      final response = await Supabase.instance.client
          .from("owners")
          .select("owner_name")
          .eq("owner_id", serviceId)
          .maybeSingle();

      if (response == null) return "";

      return response["owner_name"];
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }

  // Fetch Owner's Contact From Contacts Table
  Future<String> getOwnerContact(String serviceId) async {
    try {
      final response = await Supabase.instance.client
          .from("contacts")
          .select("contact_number")
          .eq("contact_id", serviceId)
          .maybeSingle();

      if (response == null) return "";

      return response["contact_number"];
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }

  // Fetch Service's Thumbnail From Storage
  Future<String> getServiceThumbnail(String serviceId) async {
    try {
      final bucket = "services";

      final response = await Supabase.instance.client.storage
          .from(bucket)
          .list(path: "$serviceId/");

      return Supabase.instance.client.storage
          .from(bucket)
          .getPublicUrl("$serviceId/${response.first.name}");
    } on StorageException catch (e) {
      throw Exception(e.message);
    }
  }

  // Fetch Service's Images From Storage
  Future<List<String>> getServiceImageUrls(String serviceId) async {
    try {
      final bucket = "services";

      final response = await Supabase.instance.client.storage
          .from(bucket)
          .list(path: "$serviceId/");

      return response
          .map(
            (item) => Supabase.instance.client.storage
                .from(bucket)
                .getPublicUrl("$serviceId/${item.name}"),
          )
          .toList();
    } on StorageException catch (e) {
      throw Exception(e.message);
    }
  }

  // Fetch Service's Name From Services Table
  Future<String> getServiceName(String serviceId) async {
    try {
      final response = await Supabase.instance.client
          .from("services")
          .select("service_name")
          .eq("service_id", serviceId)
          .maybeSingle();

      if (response == null) return "";

      return response["service_name"];
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }

  // Fetch Service's Description From Services Table
  Future<String> getServiceDescription(String serviceId) async {
    try {
      final response = await Supabase.instance.client
          .from("services")
          .select("service_description")
          .eq("service_id", serviceId)
          .maybeSingle();

      if (response == null) return "";

      return response["service_description"];
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }

  // Fetch Service's Rating From Services Table
  Future<String> getServiceRating(String serviceId) async {
    try {
      final response = await Supabase.instance.client
          .from("services")
          .select("service_rating")
          .eq("service_id", serviceId)
          .maybeSingle();

      if (response == null) return "";

      return response["service_rating"].toString();
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }
}
