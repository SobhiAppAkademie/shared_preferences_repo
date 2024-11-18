import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences/shared/repositories/shared_preferences/shared_preferences_keys.dart';

class SharedPreferencesRepository {
  // Unsere SharedPreferences-Instanz
  late final SharedPreferences instance;

  /// Damit können wir überprüfen, ob die await
  /// `SharedPreferences.getInstance();` bereits ausgeführt wurden ist
  bool _init = false;

  /// Initialisieren die SharedPreferences
  Future<void> init() async {
    // Wenn bereits einmal initialisiert, soll nichts ausgeführt werden
    if (_init) {
      return;
    }

    // Instanz setzen
    instance = await SharedPreferences.getInstance();

    // _init auf true setzen
    _init = true;
  }

  /// Wenn wir noch nicht initialisiert haben, geben wir einen Fehler aus
  void checkInit() {
    if (!_init) {
      throw Exception(
          "[SharedPreferencesRepository]: Bitte init() Methode vorher ausführen");
    }
  }

  /// Setzen die DarkMode-Variable
  void setThemeMode(bool isDarkMode) async {
    // Haben wir bereits initialisiert?
    checkInit();

    /// WICHTIG: Hier wird die Variable gespeichert
    bool success = await instance.setBool(DARKMODE_KEY, isDarkMode);

    // Erhalten eine Variable zurück (true, false) ob das Speichern erfolgreich
    // war
    if (success) {
      print("Variable erfolgreich gespeichert");
    } else {
      print("Variable konnte nicht gespeichert werden");
    }
  }

  /// Rufen die DarkMode-Variable ab
  bool getThemeMode() {
    // Überprüfen, ob wir initialisiert haben
    checkInit();

    /// WICHTIG: Hier rufen wir die Variable ab
    /// Nullable Boolean, da es sein kann, dass der Key nicht existiert
    bool? isDarkMode = instance.getBool(DARKMODE_KEY);

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
