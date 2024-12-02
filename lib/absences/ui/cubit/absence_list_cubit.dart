import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:nice_absence_manager_app/absences/data/absence_repository.dart';
import 'package:nice_absence_manager_app/absences/data/model/absence.dart';

part 'absence_list_state.dart';

@injectable
class AbsenceListCubit extends Cubit<AbsenceListState> {
  AbsenceListCubit(this.absenceRepository) : super(AbsenceListInitialState());

  final AbsenceRepository absenceRepository;
  final List<Absence> _allAbsence = [];

  Future<void> loadAbsenceList() async {
    emit(AbsenceListLoadingState());
    try {
      final absenceList = await absenceRepository.fetchAbsenceList();
      _allAbsence
        ..clear()
        ..addAll(absenceList);
      if (_allAbsence.isEmpty) {
        emit(AbsenceListEmptyState());
      } else {
        emit(AbsenceListLoadedState(_allAbsence));
      }
    } catch (e) {
      emit(AbsenceListErrorState());
    }
  }
}
