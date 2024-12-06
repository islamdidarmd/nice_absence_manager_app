import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nice_absence_manager_app/feature/absences/ui/cubit/absence_list_cubit.dart';
import 'package:nice_absence_manager_app/feature/absences/ui/widgets/absence_list_view.dart';
import 'package:nice_absence_manager_app/feature/absences/ui/widgets/error_view.dart';
import 'package:nice_absence_manager_app/feature/absences/ui/widgets/loading_view.dart';

class AbsenceListScreen extends StatelessWidget {
  const AbsenceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Absence List')),
      body: BlocBuilder<AbsenceListCubit, AbsenceListState>(
        builder: (_, state) {
          return switch (state) {
            AbsenceListLoadingState() => const LoadingView(),
            AbsenceListErrorState() => const ErrorView(),
            AbsenceListLoadedState() => AbsenceListView(
                totalItemCount: state.totalItemCount,
                list: state.absenceList,
                typeFilter: state.selectedFilter,
                dateFilter: state.dateRange,
              ),
            _ => const SizedBox(),
          };
        },
      ),
    );
  }
}
