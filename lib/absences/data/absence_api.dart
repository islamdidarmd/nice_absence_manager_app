import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:nice_absence_tracker_app/gen/assets.gen.dart';

typedef JsonMap = Map<String, dynamic>;

class AbsenceApi {
  Future<List<JsonMap>> fetchAllMember() async {
    final response = await _readJsonFile(Assets.mock.members);
    return response.map((e) => e as JsonMap).toList(growable: false);
  }

  Future<List<JsonMap>> fetchAllAbsent() async {
    final response = await _readJsonFile(Assets.mock.absences);
    return response.map((e) => e as JsonMap).toList(growable: false);
  }

  Future<List<dynamic>> _readJsonFile(String path) async {
    final content = await rootBundle.loadString(path);
    final data = jsonDecode(content) as JsonMap;
    return data['payload'] as List<dynamic>;
  }
}
