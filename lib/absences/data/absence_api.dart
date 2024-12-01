import 'dart:convert';
import 'dart:io';

import 'package:nice_absence_tracker_app/gen/assets.gen.dart';

typedef JsonMap = Map<String, dynamic>;

class AbsenceApi {
  Future<List<JsonMap>> fetchAllMember() => _readJsonFile(Assets.mock.members);

  Future<List<JsonMap>> fetchAllAbsent() => _readJsonFile(Assets.mock.absences);

  Future<List<JsonMap>> _readJsonFile(String path) async {
    final content = await File(path).readAsString();
    final data = jsonDecode(content) as JsonMap;
    return data['payload'] as List<JsonMap>;
  }
}
