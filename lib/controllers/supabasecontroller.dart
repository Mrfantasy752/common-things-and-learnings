import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseTrialController extends ChangeNotifier {
  authStateCheck() {
    var response =
        Supabase.instance.client.auth.onAuthStateChange((event, session) {
      if (session != null) {
        print("${session.user!.email} is currently logged in");
      } else {
        print("nobody logged in u can log in now");
      }
    });
    notifyListeners();
  }
}
