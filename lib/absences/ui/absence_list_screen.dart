import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nice_absence_manager_app/absences/ui/cubit/absence_list_cubit.dart';
import 'package:nice_absence_manager_app/absences/ui/view_model/absence_filter.dart';
import 'package:nice_absence_manager_app/absences/ui/widgets/absence_list_view.dart';
import 'package:nice_absence_manager_app/absences/ui/widgets/empty_view.dart';
import 'package:nice_absence_manager_app/absences/ui/widgets/error_view.dart';
import 'package:nice_absence_manager_app/absences/ui/widgets/loading_view.dart';

class AbsenceListScreen extends StatelessWidget {
  const AbsenceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Absence List')),
      body: BlocBuilder<AbsenceListCubit, AbsenceListState>(
        builder: (context, state) {
          if (state is AbsenceListLoadingState) {
            return const LoadingView();
          } else if (state is AbsenceListErrorState) {
            return const ErrorView();
          } else if (state is AbsenceListLoadedState) {
            return AbsenceListView(
              totalItemCount: state.totalItemCount,
              list: state.absenceList,
              typeFilter: state.selectedFilter,
              dateFilter: state.dateRange,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
