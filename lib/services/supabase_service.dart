import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static Future<void> init() async {
    await Supabase.initialize(
      url: 'https://YOUR_PROJECT_URL.supabase.co',
      anonKey: 'YOUR_ANON_KEY',
    );
  }

  static SupabaseClient get client => Supabase.instance.client;
}
