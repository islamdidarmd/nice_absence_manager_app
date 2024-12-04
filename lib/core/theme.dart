import 'package:flutter/material.dart';

final _colorSchemeLight = ColorScheme.fromSeed(seedColor: Colors.teal);

final _colorSchemeDark =
    ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: Colors.teal);

const _chipTheme = ChipThemeData(
  padding: EdgeInsets.zero,
  shape: StadiumBorder(side: BorderSide(width: 0, color: Colors.transparent)),
);

final lightTheme = ThemeData.from(colorScheme: _colorSchemeLight)
    .copyWith(chipTheme: _chipTheme);
final darkTheme = ThemeData.from(colorScheme: _colorSchemeDark)
    .copyWith(chipTheme: _chipTheme);
