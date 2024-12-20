import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nice_absence_manager_app/core/theme.dart';
import 'package:nice_absence_manager_app/di/injection.dart';
import 'package:nice_absence_manager_app/feature/absences/ui/absence_list_screen.dart';
import 'package:nice_absence_manager_app/feature/absences/ui/cubit/absence_list_cubit.dart';

void main() {
  configureDependencies();
  runApp(const NiceAbsenceManagerApp());
}

class NiceAbsenceManagerApp extends StatelessWidget {
  const NiceAbsenceManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AbsenceListCubit>(
      create: (_) => di.get()..loadInitialAbsenceList(),
      child: MaterialApp(
        title: 'Nice Absence Manager App',
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const AbsenceListScreen(),
      ),
    );
  }
}
