import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nice_absence_tracker_app/absences/data/absence_api.dart';
import 'package:nice_absence_tracker_app/absences/data/absence_repository.dart';

import 'absence_repository_test.mocks.dart';

@GenerateMocks([AbsenceApi])
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late AbsenceRepository absenceRepository;
  late MockAbsenceApi api;
  late AbsenceApi realApi;

  setUp(() {
    realApi = AbsenceApi();
    api = MockAbsenceApi();
    absenceRepository = AbsenceRepository(api);
  });

  tearDown(() {
    reset(api);
  });

  test('Returning empty member list when api returns empty', () async {
    when(api.fetchAllMember()).thenAnswer((_) async => []);
    final memberList = await absenceRepository.fetchMemberList();
    expect(memberList, isEmpty);
  });

  test('Returning member list when api returns non empty', () async {
    when(api.fetchAllMember()).thenAnswer((_) async {
      final all = await realApi.fetchAllMember();
      return all.take(5).toList();
    });

    final memberList = await absenceRepository.fetchMemberList();
    expect(memberList, hasLength(5));
  });

  test('Returning empty absent list when api returns empty', () async {
    when(api.fetchAllAbsent()).thenAnswer((_) async => []);
    final absentList = await absenceRepository.fetchAbsenceList();
    expect(absentList, isEmpty);
  });

  test('Returning absent list when api returns non empty', () async {
    when(api.fetchAllAbsent()).thenAnswer((_) async {
      final all = await realApi.fetchAllAbsent();
      return all.take(5).toList();
    });

    final absentList = await absenceRepository.fetchAbsenceList();
    expect(absentList, hasLength(5));
  });
}
