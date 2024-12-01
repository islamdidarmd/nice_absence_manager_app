import 'package:flutter/material.dart';

final _colorSchemeLight = ColorScheme.fromSeed(seedColor: Colors.teal);

final _colorSchemeDark =
    ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: Colors.teal);

final lightTheme = ThemeData.from(colorScheme: _colorSchemeLight);
final darkTheme = ThemeData.from(colorScheme: _colorSchemeDark);
