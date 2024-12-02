import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nice_absence_manager_app/absences/data/absence_api.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final api = AbsenceApi();

  group('Absence api returning Mock response', () {
    test('member list is in correct format', () async {
      final absenceList = await api.fetchAllAbsent();
      expect(absenceList, isNotEmpty);
      expect(absenceList.runtimeType, List<JsonMap>);
    });

    test('absence list is in correct format', () async {
      final absenceList = await api.fetchAllAbsent();
      expect(absenceList, isNotEmpty);
      expect(absenceList.runtimeType, List<JsonMap>);
    });
  });
}
