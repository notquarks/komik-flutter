import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((_) {
  return throw UnimplementedError();
});

final darkModeProvider = ChangeNotifierProvider<DarkModeNotifier>((ref) {
  return DarkModeNotifier(ref.watch(sharedPreferencesProvider));
});

class DarkModeNotifier extends ChangeNotifier {
  DarkModeNotifier(this.prefs);
  final SharedPreferences prefs;
  // getDarkMode() => prefs.getBool('bDarkMode') ?? false;
  var brightness = SchedulerBinding.instance.window.platformBrightness;
  bool getDarkMode() =>
      prefs.getBool('bDarkMode') ?? brightness == Brightness.dark;

  setDarkMode(bool darkMode) {
    prefs.setBool('bDarkMode', darkMode);
    notifyListeners();
  }
}
