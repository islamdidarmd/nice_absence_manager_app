import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:nice_absence_manager_app/absences/data/absence_repository.dart';
import 'package:nice_absence_manager_app/absences/data/model/absence.dart';
import 'package:nice_absence_manager_app/absences/ui/view_model/absence_list_item_model.dart';

part 'absence_list_state.dart';

@injectable
class AbsenceListCubit extends Cubit<AbsenceListState> {
  AbsenceListCubit(this.absenceRepository) : super(AbsenceListInitialState());

  final AbsenceRepository absenceRepository;
  final List<AbsenceListItemModel> _allAbsence = [];

  Future<void> loadAbsenceList() async {
    emit(AbsenceListLoadingState());
    try {
      _allAbsence
        ..clear()
        ..addAll(await _fetchModels());
      if (_allAbsence.isEmpty) {
        emit(AbsenceListEmptyState());
      } else {
        emit(AbsenceListLoadedState(_allAbsence));
      }
    } catch (e) {
      emit(AbsenceListErrorState());
    }
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
