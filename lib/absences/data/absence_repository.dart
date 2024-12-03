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
    //simulating a fake paginated api call
    final allAbsent = (await absenceApi.fetchAllAbsent())
        .map((e) => Absence.fromMap(e))
        .toList(growable: false);

    final filtered = allAbsent.where(
      (e) {
        bool passedTypeCheck = false;
        bool passedDateCheck = false;

        if (type == null || e.type == type) {
          passedTypeCheck = true;
        }
        if (range == null ||
            (e.startDate.isAfter(range.start) &&
                e.endDate.isBefore(range.end))) {
          passedDateCheck = true;
        }

        return passedTypeCheck && passedDateCheck;
      },
    );

    final itemsForPage = filtered
        .skip(page * itemsPerPage)
        .take(itemsPerPage)
        .toList(growable: false);
    //
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
    await Future.delayed(const Duration(seconds: 1));
    return allMember.map((e) => Member.fromMap(e)).toList(growable: false);
  }
}
