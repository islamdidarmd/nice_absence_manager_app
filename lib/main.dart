import 'package:flutter/material.dart';
import 'package:nice_absence_manager_app/absences/ui/absence_list.dart';
import 'package:nice_absence_manager_app/di/injection.dart';
import 'package:nice_absence_manager_app/theme.dart';

void main() {
  configureDependencies();
  runApp(const NiceAbsenceManagerApp());
}

class NiceAbsenceManagerApp extends StatelessWidget {
  const NiceAbsenceManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nice Absence Manager App',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const AbsenceList(),
    );
  }
}
