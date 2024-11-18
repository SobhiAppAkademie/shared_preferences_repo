import 'package:flutter/material.dart';
import 'package:sharedpreferences/features/home/screens/start_screen.dart';
import 'package:sharedpreferences/shared/repositories/shared_preferences/shared_preferences_repository.dart';

class App extends StatelessWidget {
  // Erhalten die Instanz aus der main.dart
  final SharedPreferencesRepository preferencesRepository;

  const App({super.key, required this.preferencesRepository});

  @override
  Widget build(BuildContext context) {
    // Rufen den aktuellen Wert lokal ab
    bool isDarkMode = preferencesRepository.getThemeMode();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(scaffoldBackgroundColor: Colors.black),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,

      /// Hier schauen wir, ob wir lokal den DarkMode gesetzt haben
      initialRoute: "start",
      onGenerateRoute: (RouteSettings route) {
        switch (route.name) {
          default:

            /// Übergeben die Klasse unseren StartScreen
            return MaterialPageRoute(
                builder: (context) =>
                    StartScreen(preferencesRepository: preferencesRepository));
        }
      },
    );
  }
}
