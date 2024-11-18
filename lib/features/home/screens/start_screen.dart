import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/repositories/shared_preferences/shared_preferences_repository.dart';

class StartScreen extends StatefulWidget {
  /// Erhalten aus der app.dart die Instanz
  final SharedPreferencesRepository preferencesRepository;

  const StartScreen({super.key, required this.preferencesRepository});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  /// Lokale Variable die in der initState() gesetzt wird
  bool isDarkMode = false;

  @override
  void initState() {
    /// Rufen die lokale DarkMode Variable die auf dem Smartphone/Gerät gespeichert ist
    isDarkMode = widget.preferencesRepository.getThemeMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoSwitch(
            value: isDarkMode,
            onChanged: (value) {
              /// Setzen unsere Variable auf unserem Gerät
              widget.preferencesRepository.setThemeMode(value);
              setState(() {
                /// Aus Design-Gründen damit der Schalter korrekt umgelegt wird,
                /// rufen wir die DarkMode-Variable nochmal ab
                isDarkMode = widget.preferencesRepository.getThemeMode();
              });
            }),
      ),
    );
  }
}
