import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:nice_absence_manager_app/absences/data/absence_repository.dart';
import 'package:nice_absence_manager_app/absences/data/model/absence.dart';
import 'package:nice_absence_manager_app/absences/data/model/member.dart';
import 'package:nice_absence_manager_app/absences/data/model/paginated_response.dart';
import 'package:nice_absence_manager_app/absences/ui/view_model/absence_filter.dart';
import 'package:nice_absence_manager_app/absences/ui/view_model/absence_list_item_model.dart';

part 'absence_list_state.dart';

@injectable
class AbsenceListCubit extends Cubit<AbsenceListState> {
  AbsenceListCubit(this.absenceRepository) : super(AbsenceListInitialState());
  final AbsenceRepository absenceRepository;

  final List<Member> _memberList = [];
  final List<AbsenceListItemModel> _paginatedAbsence = [];
  PaginatedResponse<Absence>? _paginatedResponse;

  TypeFilter _typeFilter = TypeFilter.all;
  DateTimeRange? _dateRangeFilter;
  bool _isLoadingNext = false;

  Future<void> loadAbsenceList() async {
    emit(AbsenceListLoadingState());
    try {
      final memberList = await absenceRepository.fetchMemberList();
      _memberList
        ..clear()
        ..addAll(memberList);
      await _fetchNextPage();
      emit(_createListLoadedState());
    } catch (e) {
      emit(AbsenceListErrorState());
    }
  }

  Future<void> loadMore() async {
    if (_isLoadingNext || _paginatedResponse?.hasMore == false) {
      return;
    }

    try {
      _isLoadingNext = true;
      await _fetchNextPage();
      emit(_createListLoadedState());
      _isLoadingNext = false;
    } catch (e) {
      //todo: add error state
    }
  }

  Future<void> filterAbsenceListByType(TypeFilter newFilter) async {
    if (_typeFilter == newFilter) {
      return;
    }
    _clearCurrentList();
    _typeFilter = newFilter;

    try {
      await _fetchNextPage();
      emit(_createListLoadedState());
    } catch (e) {
      //todo: add error state
    }
  }

  Future<void> filterAbsenceListByDate(DateTimeRange range) async {
    _clearCurrentList();
    _dateRangeFilter = range;

    try {
      await _fetchNextPage();
      emit(_createListLoadedState());
    } catch (e) {
      //todo: add error state
    }
  }

  Future<void> _fetchNextPage() async {
    final currentPage = _paginatedResponse?.currentPage ?? -1;
    _paginatedResponse = await absenceRepository.fetchAbsencesListByFilter(
      type: _getAbsenceTypeFromFilter(),
      range: _dateRangeFilter,
      page: currentPage + 1,
    );
    final mappedList = await _mapMemberWithId(_paginatedResponse!.items);
    _paginatedAbsence.addAll(mappedList);
  }

  String? _getAbsenceTypeFromFilter() {
    return switch (_typeFilter) {
      TypeFilter.all => null,
      TypeFilter.sickness => 'sickness',
      TypeFilter.vacation => 'vacation',
    };
  }

  void _clearCurrentList() {
    _paginatedAbsence.clear();
    _paginatedResponse = null;
  }

  AbsenceListLoadedState _createListLoadedState() {
    return AbsenceListLoadedState(
      selectedFilter: _typeFilter,
      absenceList: _paginatedAbsence,
      totalItemCount: _paginatedResponse!.totalItemCount,
      dateRange: _dateRangeFilter,
    );
  }

  Future<List<AbsenceListItemModel>> _mapMemberWithId(
    List<Absence> absenceList,
  ) async {
    return absenceList.map((absence) {
      final member = _memberList.firstWhere((e) => e.userId == absence.userId);
      return AbsenceListItemModel.from(absence, member);
    }).toList();
  }
}
