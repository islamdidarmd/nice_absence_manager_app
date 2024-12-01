import 'package:flutter/material.dart';
import 'package:nice_absence_tracker_app/absence_list.dart';
import 'package:nice_absence_tracker_app/theme.dart';

void main() {
  runApp(const NiceAbsenceTrackerApp());
}

class NiceAbsenceTrackerApp extends StatelessWidget {
  const NiceAbsenceTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nice Absence Tracker App',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const AbsenceList(),
    );
  }
}
