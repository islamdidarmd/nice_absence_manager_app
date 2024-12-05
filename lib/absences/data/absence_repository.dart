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

  Future<PaginatedResponse<Absence>> fetchAbsencesListByFilter({
    String? type,
    DateTimeRange? range,
    int page = 0,
  }) async {
    //Simulating a fake paginated api call.
    //In real life we expect paginated data will be sent from Backend
    //For now: adding pagination login here
    //absenceApi is working like a file reader from storage
    final allAbsent = await _simulateListFromFakeDB();
    final filtered = allAbsent.where(
      (e) => _doesAbsenceMatchesQuery(type, e, range),
    );

    final itemsForPage = filtered
        .skip(page * itemsPerPage)
        .take(itemsPerPage)
        .toList(growable: false);

    return PaginatedResponse(
      totalItemCount: filtered.length,
      items: itemsForPage,
      currentPage: page,
      hasMore: itemsForPage.length == itemsPerPage,
    );
  }

  Future<List<Member>> fetchMemberList() async {
    final allMember = await absenceApi.fetchAllMember();
    //simulate api call
    await Future<void>.delayed(const Duration(seconds: 1));
    return allMember.map((e) => Member.fromMap(e)).toList(growable: false);
  }

  bool _doesAbsenceMatchesQuery(String? type, Absence e, DateTimeRange? range) {
    bool passedTypeCheck = false;
    bool passedDateCheck = false;

    if (type == null || e.type == type) {
      passedTypeCheck = true;
    }
    if (range == null ||
        (e.startDate.isAfter(range.start) && e.endDate.isBefore(range.end))) {
      passedDateCheck = true;
    }

    return passedTypeCheck && passedDateCheck;
  }

  Future<List<Absence>> _simulateListFromFakeDB() async {
    return (await absenceApi.fetchAllAbsent())
        .map((e) => Absence.fromMap(e))
        .toList(growable: false);
  }
}
