part of 'absence_list_cubit.dart';

sealed class AbsenceListState {
  const AbsenceListState();
}

final class AbsenceListInitialState extends AbsenceListState {}

final class AbsenceListLoadingState extends AbsenceListState {}

final class AbsenceListErrorState extends AbsenceListState {}

final class AbsenceListLoadedState extends AbsenceListState {
  const AbsenceListLoadedState({
    required this.selectedFilter,
    required this.absenceList,
    required this.totalItemCount,
    this.dateRange,
  });

  final int totalItemCount;
  final TypeFilter selectedFilter;
  final DateTimeRange? dateRange;

  final List<AbsenceListItemModel> absenceList;
}
