import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences/shared/repositories/shared_preferences/shared_preferences_keys.dart';

class SharedPreferencesRepository {
  // Unsere SharedPreferences-Instanz
  final SharedPreferencesAsync instance = SharedPreferencesAsync();


  /// Setzen die DarkMode-Variable
  void setThemeMode(bool isDarkMode) async {


    /// WICHTIG: Hier wird die Variable gespeichert
    await instance.setBool(DARKMODE_KEY, isDarkMode);

    print("Variable erfolgreich gespeichert");
  }

  /// Rufen die DarkMode-Variable ab
  Future<bool> getThemeMode() async {


    /// WICHTIG: Hier rufen wir die Variable ab
    /// Nullable Boolean, da es sein kann, dass der Key nicht existiert
    bool? isDarkMode = await instance.getBool(DARKMODE_KEY);

    // Wenn es null ist, haben wir die Variable vorher nicht gespeichert!!
    if (isDarkMode == null) {
      print("Key existiert nicht");
      return false;
    }

    // Geben unsere Variable, die wir aus dem lokalen Speicher abgerufen haben
    // zurück
    return isDarkMode;
  }
}
