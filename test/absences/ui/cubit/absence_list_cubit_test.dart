import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nice_absence_manager_app/absences/data/absence_repository.dart';
import 'package:nice_absence_manager_app/absences/data/model/member.dart';
import 'package:nice_absence_manager_app/absences/data/model/paginated_response.dart';
import 'package:nice_absence_manager_app/absences/ui/cubit/absence_list_cubit.dart';

import 'absence_list_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AbsenceRepository>()])
void main() {
  group('Absence cubit emits correct state', () {
    late AbsenceRepository absenceRepository;
    blocTest<AbsenceListCubit, AbsenceListState>(
      'Returns success state when no exception',
      setUp: () {
        absenceRepository = MockAbsenceRepository();
        when(absenceRepository.fetchMemberList()).thenAnswer((_) async {
          return <Member>[];
        });
        when(absenceRepository.fetchAbsencesListByFilter())
            .thenAnswer((_) async {
          return const PaginatedResponse(
            totalItemCount: 10,
            items: [],
            currentPage: 1,
            hasMore: true,
          );
        });
      },
      tearDown: () {
        reset(absenceRepository);
      },
      build: () => AbsenceListCubit(absenceRepository),
      act: (cubit) {
        cubit.loadInitialAbsenceList();
      },
      expect: () => [
        isA<AbsenceListLoadingState>(),
        isA<AbsenceListLoadedState>(),
      ],
    );

    blocTest<AbsenceListCubit, AbsenceListState>(
      'Returns error state when exception thrown in repository',
      setUp: () {
        absenceRepository = MockAbsenceRepository();
        when(absenceRepository.fetchMemberList()).thenThrow(Exception());
        when(absenceRepository.fetchAbsencesListByFilter()).thenThrow(Exception());
      },
      tearDown: () {
        reset(absenceRepository);
      },
      build: () => AbsenceListCubit(absenceRepository),
      act: (cubit) {
        cubit.loadInitialAbsenceList();
      },
      expect: () => [
        isA<AbsenceListLoadingState>(),
        isA<AbsenceListErrorState>(),
      ],
    );
  });
}
