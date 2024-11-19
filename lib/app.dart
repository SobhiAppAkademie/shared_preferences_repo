import 'package:flutter/material.dart';
import 'package:sharedpreferences/features/home/screens/start_screen.dart';
import 'package:sharedpreferences/shared/repositories/shared_preferences/shared_preferences_repository.dart';

class App extends StatefulWidget {
  // Erhalten die Instanz aus der main.dart
  final SharedPreferencesRepository preferencesRepository;

  // DarkMode Variable
  final bool isDarkMode;

  const App({super.key, required this.preferencesRepository, required this.isDarkMode});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {


  /// Lokale Variable, um in Echtzeit den Dark-Mode an -oder abzuschalten
  bool _isDarkMode = false;

  @override
  void initState() {
    _isDarkMode = widget.isDarkMode;
    super.initState();
  }

  void updateThemeMode(bool isDarkMode){
    setState(() {
      _isDarkMode = isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(scaffoldBackgroundColor: Colors.black),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,

      /// Hier schauen wir, ob wir lokal den DarkMode gesetzt haben
      initialRoute: "start",
      onGenerateRoute: (RouteSettings route) {
        switch (route.name) {
          default:

          /// Übergeben die Klasse unseren StartScreen
            return MaterialPageRoute(
                builder: (context) =>
                    StartScreen(preferencesRepository: widget.preferencesRepository, onChangeThemeMode: (darkMode) => updateThemeMode(darkMode)));
        }
      },
    );
  }
}
