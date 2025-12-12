import 'package:supabase_flutter/supabase_flutter.dart';

class ShopServices {
  // Fetch Shop's Type From Shop Table
  Future<String> getShopType(String shopId) async {
    try {
      final response = await Supabase.instance.client
          .from("shops")
          .select("shop_type")
          .eq("shop_id", shopId)
          .maybeSingle();

      if (response == null) return "";

      return response["shop_type"];
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception("Error in getting shop type: $e");
    }
  }
}
