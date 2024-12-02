import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:nice_absence_manager_app/absences/data/absence_repository.dart';
import 'package:nice_absence_manager_app/absences/data/model/absence.dart';
import 'package:nice_absence_manager_app/absences/ui/view_model/absence_filter.dart';
import 'package:nice_absence_manager_app/absences/ui/view_model/absence_list_item_model.dart';

part 'absence_list_state.dart';

@injectable
class AbsenceListCubit extends Cubit<AbsenceListState> {
  AbsenceListCubit(this.absenceRepository) : super(AbsenceListInitialState());

  final AbsenceRepository absenceRepository;
  final List<AbsenceListItemModel> _allAbsence = [];
  final List<AbsenceListItemModel> _filtered = [];

  var _typeFilter = TypeFilter.all;

  Future<void> loadAbsenceList() async {
    emit(AbsenceListLoadingState());
    try {
      _allAbsence
        ..clear()
        ..addAll(await _fetchModels());
      if (_allAbsence.isEmpty) {
        emit(AbsenceListEmptyState());
      } else {
        emit(AbsenceListLoadedState(_typeFilter, _allAbsence));
      }
    } catch (e) {
      emit(AbsenceListErrorState());
    }
  }

  void filterAbsenceListByType(TypeFilter newFilter) {
    if (_typeFilter == newFilter) {
      return;
    }

    _typeFilter = newFilter;
    switch (_typeFilter) {
      case TypeFilter.all:
        _filtered
          ..clear()
          ..addAll(_allAbsence);
      case TypeFilter.sickness:
        _filtered
          ..clear()
          ..addAll(
            _allAbsence.where((e) => e.type == AbsenceType.sickness),
          );
      case TypeFilter.vacation:
        _filtered
          ..clear()
          ..addAll(
            _allAbsence.where((e) => e.type == AbsenceType.vacation),
          );
    }
    emit(AbsenceListLoadedState(_typeFilter, _filtered));
  }

  void filterAbsenceListByDate(DateTime start, DateTime end) {
    _typeFilter = TypeFilter.all;
    _filtered
      ..clear()
      ..addAll(
        _allAbsence.where(
            (e) => e.startDate.isAfter(start) && e.endDate.isBefore(end)),
      );
    emit(
      AbsenceListLoadedState(
        _typeFilter,
        _filtered,
        startDate: start,
        endDate: end,
      ),
    );
  }

  Future<List<AbsenceListItemModel>> _fetchModels() async {
    final absenceList = await absenceRepository.fetchAbsenceList();
    final memberList = await absenceRepository.fetchMemberList();

    return absenceList.map((absence) {
      final member = memberList.firstWhere((e) => e.userId == absence.userId);
      return AbsenceListItemModel.from(absence, member);
    }).toList();
  }
}
