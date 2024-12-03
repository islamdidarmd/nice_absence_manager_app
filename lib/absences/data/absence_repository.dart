import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:nice_absence_manager_app/absences/data/absence_api.dart';
import 'package:nice_absence_manager_app/absences/data/model/absence.dart';
import 'package:nice_absence_manager_app/absences/data/model/member.dart';
import 'package:nice_absence_manager_app/absences/data/model/paginated_response.dart';

@injectable
class AbsenceRepository {
  AbsenceRepository(this.absenceApi);

  final AbsenceApi absenceApi;
  final itemsPerPage = 10;

  Future<List<Absence>> fetchAbsenceList() async {
    final allAbsent = await absenceApi.fetchAllAbsent();
    await Future.delayed(Duration(seconds: 1));
    return allAbsent.map((e) => Absence.fromMap(e)).toList(growable: false);
  }

  Future<PaginatedResponse<Absence>> fetchAbsencesByType(String type,
      {int page = 0}) async {
    //simulating a fake paginated api call
    final allAbsent = (await absenceApi.fetchAllAbsent())
        .map((e) => Absence.fromMap(e))
        .toList(growable: false);

    final filtered = allAbsent.where((e) => e.type == type);
    final itemsForPage = filtered
        .skip(page * itemsPerPage)
        .take(itemsPerPage)
        .toList(growable: false);
    final hasMore = itemsForPage.length == itemsPerPage;
    return PaginatedResponse(filtered.length, itemsForPage, hasMore);
  }

  Future<PaginatedResponse<Absence>> fetchAbsencesByDateRange(
    DateTimeRange range, {
    int page = 0,
  }) async {
    //simulating a fake paginated api call
    final allAbsent = (await absenceApi.fetchAllAbsent())
        .map((e) => Absence.fromMap(e))
        .toList(growable: false);

    final filtered = allAbsent.where(
      (e) => e.startDate.isAfter(range.start) && e.endDate.isBefore(range.end),
    );
    final itemsForPage = filtered
        .skip(page * itemsPerPage)
        .take(itemsPerPage)
        .toList(growable: false);
    final hasMore = itemsForPage.length == itemsPerPage;
    return PaginatedResponse(filtered.length, itemsForPage, hasMore);
  }

  Future<List<Member>> fetchMemberList() async {
    final allMember = await absenceApi.fetchAllMember();
    await Future.delayed(Duration(seconds: 1));
    return allMember.map((e) => Member.fromMap(e)).toList(growable: false);
  }
}
