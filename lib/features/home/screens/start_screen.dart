import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/repositories/shared_preferences/shared_preferences_repository.dart';

class StartScreen extends StatefulWidget {
  /// Erhalten aus der app.dart die Instanz
  final SharedPreferencesRepository preferencesRepository;

  final Function(bool) onChangeThemeMode;

  const StartScreen({super.key, required this.preferencesRepository, required this.onChangeThemeMode});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  /// Lokale Variable die in der initState() gesetzt wird
  bool isDarkMode = false;

  @override
  void initState() {
    /// Rufen die lokale DarkMode Variable die auf dem Smartphone/Gerät gespeichert ist
    widget.preferencesRepository.getThemeMode().then((value)  {
      isDarkMode = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoSwitch(
            value: isDarkMode,
            onChanged: (value) async {
              /// Setzen unsere Variable auf unserem Gerät
              widget.preferencesRepository.setThemeMode(value);

              /// Aus Design-Gründen damit der Schalter korrekt umgelegt wird,
              /// rufen wir die DarkMode-Variable nochmal ab
              isDarkMode = await widget.preferencesRepository.getThemeMode();


              setState(()  {
              });

              widget.onChangeThemeMode(isDarkMode);
            }),
      ),
    );
  }
}
