import 'package:supabase_flutter/supabase_flutter.dart';

class FoodServiceServices {
  // Fetch Food Service's Type From Food Service Table
  Future<String> getFoodServiceType(String foodServiceId) async {
    try {
      final response = await Supabase.instance.client
          .from("food_services")
          .select("food_service_type")
          .eq("food_service_id", foodServiceId)
          .maybeSingle();

      if (response == null) return "";

      return response["food_service_type"];
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception("Error in getting food service type: $e");
    }
  }
}
