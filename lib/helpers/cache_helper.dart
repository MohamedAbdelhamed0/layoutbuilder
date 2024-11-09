import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static const _screen1WidthKey = 'screen1Width';
  static const _screen2WidthKey = 'screen2Width';
  static const _screen3WidthKey = 'screen3Width';
  static const _isScreen2FullScreenKey = 'isScreen2FullScreen';

  // Save screen widths
  static Future<void> saveScreen1Width(double width) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_screen1WidthKey, width);
  }

  static Future<void> saveScreen2Width(double width) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_screen2WidthKey, width);
  }

  static Future<void> saveScreen3Width(double width) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_screen3WidthKey, width);
  }

  // Save fullscreen state
  static Future<void> saveScreen2FullScreenState(bool isFullScreen) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isScreen2FullScreenKey, isFullScreen);
  }

  // Load screen widths
  static Future<double> getScreen1Width() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_screen1WidthKey) ?? 0.20; // default fraction
  }

  static Future<double> getScreen2Width() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_screen2WidthKey) ?? 0.46; // default fraction
  }

  static Future<double> getScreen3Width() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_screen3WidthKey) ?? 0.34; // default fraction
  }

  // Load fullscreen state
  static Future<bool> isScreen2FullScreen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isScreen2FullScreenKey) ?? false;
  }
}
