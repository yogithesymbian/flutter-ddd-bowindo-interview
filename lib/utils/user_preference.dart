import 'package:flutter_wonderwoman_projectscoid/utils/config/env.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  Future<bool> checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return (prefs.getBool(Env.kStateOnBoarding) ?? false);
  }

  void setCheckFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Env.kStateOnBoarding, true);
  }
}
