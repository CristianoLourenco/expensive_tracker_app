import 'package:flutter/material.dart';

class AppConfig {
  // ! Theme of the app
  final _kColorScheme =
      ColorScheme.fromSeed(seedColor: Colors.blue);

  final _kDarkColorScheme = ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 0, 145, 255));

  ThemeData get theme {
    return ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: _kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: _kColorScheme.onPrimaryContainer,
        foregroundColor: _kColorScheme.primaryContainer,
      ),
      cardTheme: const CardTheme().copyWith(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)),
        color: _kColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _kColorScheme.primaryContainer,
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: _kColorScheme.onSecondaryContainer,
            ),
          ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: _kDarkColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor:
            _kDarkColorScheme.onPrimaryContainer,
        foregroundColor: _kDarkColorScheme.primaryContainer,
      ),
      cardTheme: const CardTheme().copyWith(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)),
        color: _kDarkColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              _kDarkColorScheme.primaryContainer,
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: _kDarkColorScheme.onSecondaryContainer,
            ),
          ),
    );
  }
}
