import 'package:flutter/material.dart';
import 'package:sharedpreferences/app.dart';
import 'package:sharedpreferences/shared/repositories/shared_preferences/shared_preferences_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Unseren Repository erstellen
  SharedPreferencesRepository preferencesRepository =
      SharedPreferencesRepository();

  bool isDarkMode = await preferencesRepository.getThemeMode();

  // Übergeben unser Repository unserer App
  runApp(App(preferencesRepository: preferencesRepository, isDarkMode: isDarkMode));
}
