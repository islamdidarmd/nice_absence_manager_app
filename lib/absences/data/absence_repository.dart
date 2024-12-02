import 'package:injectable/injectable.dart';
import 'package:nice_absence_manager_app/absences/data/absence_api.dart';
import 'package:nice_absence_manager_app/absences/data/model/absence.dart';
import 'package:nice_absence_manager_app/absences/data/model/member.dart';

@injectable
class AbsenceRepository {
  AbsenceRepository(this.absenceApi);

  final AbsenceApi absenceApi;

  Future<List<Absence>> fetchAbsenceList() async {
    final allAbsent = await absenceApi.fetchAllAbsent();
    await Future.delayed(Duration(seconds: 5));
    return allAbsent.map((e) => Absence.fromMap(e)).toList(growable: false);
  }

  Future<List<Member>> fetchMemberList() async {
    final allMember = await absenceApi.fetchAllMember();
    await Future.delayed(Duration(seconds: 5));
    return allMember.map((e) => Member.fromMap(e)).toList(growable: false);
  }
}
