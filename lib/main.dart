import 'package:flutter/material.dart';
import 'package:sharedpreferences/app.dart';
import 'package:sharedpreferences/shared/repositories/shared_preferences/shared_preferences_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Unseren Repository erstellen
  SharedPreferencesRepository preferencesRepository =
      SharedPreferencesRepository();

  // Unsere interne Init-Methode ausführen
  // Hier wird die Instanz für den SharedPreferences gesetzt
  await preferencesRepository.init();

  // Übergeben unser Repository unserer App
  runApp(App(preferencesRepository: preferencesRepository));
}
