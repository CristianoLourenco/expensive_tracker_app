import 'package:expensive_tracker_app/appconfig.dart';
import 'package:expensive_tracker_app/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      darkTheme: AppConfig().darkTheme,
      theme: AppConfig().theme,
      themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
}
