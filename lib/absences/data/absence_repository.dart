import 'package:nice_absence_tracker_app/absences/data/absence_api.dart';
import 'package:nice_absence_tracker_app/absences/data/model/absence.dart';
import 'package:nice_absence_tracker_app/absences/data/model/member.dart';

class AbsenceRepository {
  AbsenceRepository(this.absenceApi);

  final AbsenceApi absenceApi;

  Future<List<Absence>> fetchAbsenceList() async {
    final allAbsent = await absenceApi.fetchAllAbsent();
    return allAbsent.map((e) => Absence.fromMap(e)).toList(growable: false);
  }

  Future<List<Member>> fetchMemberList() async {
    final allMember = await absenceApi.fetchAllMember();
    return allMember.map((e) => Member.fromMap(e)).toList(growable: false);
  }
}
