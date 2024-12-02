part of 'absence_list_cubit.dart';

sealed class AbsenceListState {
  const AbsenceListState();
}

final class AbsenceListInitialState extends AbsenceListState {}

final class AbsenceListLoadingState extends AbsenceListState {}

final class AbsenceListErrorState extends AbsenceListState {}

final class AbsenceListEmptyState extends AbsenceListState {}

final class AbsenceListLoadedState extends AbsenceListState {
  const AbsenceListLoadedState(this.selectedFilter, this.absenceList,
      {this.startDate, this.endDate});

  final TypeFilter selectedFilter;
  final DateTime? startDate;
  final DateTime? endDate;

  final List<AbsenceListItemModel> absenceList;
}
