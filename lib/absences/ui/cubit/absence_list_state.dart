part of 'absence_list_cubit.dart';

sealed class AbsenceListState extends Equatable {
  const AbsenceListState();

  @override
  List<Object?> get props => [];
}

final class AbsenceListInitialState extends AbsenceListState {}

final class AbsenceListLoadingState extends AbsenceListState {}

final class AbsenceListErrorState extends AbsenceListState {}

final class AbsenceListEmptyState extends AbsenceListState {}

final class AbsenceListLoadedState extends AbsenceListState {
  const AbsenceListLoadedState(this.absenceList);

  final List<AbsenceListItemModel> absenceList;

  @override
  List<Object?> get props => [absenceList];
}
