import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nice_absence_manager_app/absences/ui/cubit/absence_list_cubit.dart';
import 'package:nice_absence_manager_app/absences/ui/widgets/absence_list_view.dart';
import 'package:nice_absence_manager_app/absences/ui/widgets/empty_view.dart';
import 'package:nice_absence_manager_app/absences/ui/widgets/error_view.dart';
import 'package:nice_absence_manager_app/absences/ui/widgets/loading_view.dart';
import 'package:nice_absence_manager_app/di/injection.dart';

class AbsenceList extends StatelessWidget {
  const AbsenceList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AbsenceListCubit>(
      create: (_) => di.get()..loadAbsenceList(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Absence List')),
        body: BlocBuilder<AbsenceListCubit, AbsenceListState>(
          builder: (context, state) {
            if (state is AbsenceListLoadingState) {
              return const LoadingView();
            } else if (state is AbsenceListErrorState) {
              return const ErrorView();
            } else if (state is AbsenceListLoadedState) {
              return AbsenceListView(state.absenceList);
            }
            return const EmptyView();
          },
        ),
      ),
    );
  }
}
