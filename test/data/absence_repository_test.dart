import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nice_absence_manager_app/absences/data/absence_api.dart';
import 'package:nice_absence_manager_app/absences/data/absence_repository.dart';

import 'absence_repository_test.mocks.dart';

@GenerateMocks([AbsenceApi])
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late AbsenceRepository absenceRepository;
  late MockAbsenceApi api;
  late AbsenceApi realApi;

  const vacationCount = 35;
  const itemsPerPage = 10;

  setUp(() {
    realApi = AbsenceApi();
    api = MockAbsenceApi();
    absenceRepository = AbsenceRepository(api);
  });

  tearDown(() {
    reset(api);
  });

  group('Member list api working correctly', () {
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
  });

  group('Pagination working correctly for type', () {
    test('returns full page items when has more', () async {
      when(api.fetchAllAbsent()).thenAnswer((_) async {
        final all = await realApi.fetchAllAbsent();
        return all.toList();
      });

      final vacAbsentList = await absenceRepository.fetchAbsencesListByFilter(
          type: 'vacation', page: 0);
      expect(vacAbsentList.totalItemCount, vacationCount);
      expect(vacAbsentList.items.length, equals(itemsPerPage));
      expect(vacAbsentList.hasMore, equals(true));
    });

    test('returns partial page items for last page when has less item',
        () async {
      when(api.fetchAllAbsent()).thenAnswer((_) async {
        final all = await realApi.fetchAllAbsent();
        return all.toList();
      });

      final vacAbsentList = await absenceRepository.fetchAbsencesListByFilter(
          type: 'vacation', page: 4);
      expect(vacAbsentList.totalItemCount, vacationCount);
      expect(vacAbsentList.items.length, lessThanOrEqualTo(itemsPerPage));
      expect(vacAbsentList.hasMore, equals(false));
    });
  });

  group('Pagination working correctly for date range', () {
    test('returns full page items when has more', () async {
      when(api.fetchAllAbsent()).thenAnswer((_) async {
        final all = await realApi.fetchAllAbsent();
        return all.toList();
      });

      final vacAbsentList = await absenceRepository.fetchAbsencesListByFilter(
        range: DateTimeRange(
          start: DateTime.parse("2021-01-01"),
          end: DateTime.parse("2021-04-01"),
        ),
        page: 0,
      );
      expect(vacAbsentList.totalItemCount, 22);
      expect(vacAbsentList.items.length, equals(itemsPerPage));
      expect(vacAbsentList.hasMore, equals(true));
    });

    test('returns partial page items for last page when has less item',
        () async {
      when(api.fetchAllAbsent()).thenAnswer((_) async {
        final all = await realApi.fetchAllAbsent();
        return all.toList();
      });

      final vacAbsentList = await absenceRepository.fetchAbsencesListByFilter(
        range: DateTimeRange(
          start: DateTime.parse("2021-01-01"),
          end: DateTime.parse("2021-01-30"),
        ),
        page: 0,
      );
      expect(vacAbsentList.totalItemCount, 3);
      expect(vacAbsentList.items.length, lessThanOrEqualTo(itemsPerPage));
      expect(vacAbsentList.hasMore, equals(false));
    });
  });

  group('Pagination working correctly for both filter', () {
    test('returns full page items when has more', () async {
      when(api.fetchAllAbsent()).thenAnswer((_) async {
        final all = await realApi.fetchAllAbsent();
        return all.toList();
      });

      final vacAbsentList = await absenceRepository.fetchAbsencesListByFilter(
        type: 'vacation',
        range: DateTimeRange(
          start: DateTime.parse("2021-01-01"),
          end: DateTime.parse("2021-04-01"),
        ),
        page: 0,
      );
      expect(vacAbsentList.totalItemCount, 18);
      expect(vacAbsentList.items.length, equals(itemsPerPage));
      expect(vacAbsentList.hasMore, equals(true));
    });

    test('returns partial page items for last page when has less item',
        () async {
      when(api.fetchAllAbsent()).thenAnswer((_) async {
        final all = await realApi.fetchAllAbsent();
        return all.toList();
      });

      final vacAbsentList = await absenceRepository.fetchAbsencesListByFilter(
        type: 'vacation',
        range: DateTimeRange(
          start: DateTime.parse("2021-01-01"),
          end: DateTime.parse("2021-01-30"),
        ),
        page: 0,
      );
      expect(vacAbsentList.totalItemCount, 2);
      expect(vacAbsentList.items.length, lessThanOrEqualTo(itemsPerPage));
      expect(vacAbsentList.hasMore, equals(false));
    });
  });
}
