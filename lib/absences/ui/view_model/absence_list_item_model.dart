import 'package:nice_absence_manager_app/absences/data/model/absence.dart';
import 'package:nice_absence_manager_app/absences/data/model/member.dart';

enum AbsenceStatus {
  requested,
  rejected,
  confirmed,
}

enum AbsenceType {
  vacation,
  sickness,
}

class AbsenceListItemModel {
  const AbsenceListItemModel({
    required this.userId,
    required this.memberName,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.memberNote,
    required this.rejectedAt,
    required this.admitterNote,
    required this.status,
  });

  factory AbsenceListItemModel.from(Absence absence, Member member) {
    var status = AbsenceStatus.requested;
    if (absence.rejectedAt != null) {
      status = AbsenceStatus.rejected;
    } else if (absence.confirmedAt != null) {
      status = AbsenceStatus.confirmed;
    }
    var type = AbsenceType.vacation;
    if (absence.type == 'sickness') {
      type = AbsenceType.sickness;
    }

    return AbsenceListItemModel(
      userId: absence.userId,
      memberName: member.name,
      type: type,
      startDate: absence.startDate,
      endDate: absence.endDate,
      memberNote: absence.memberNote,
      rejectedAt: absence.rejectedAt,
      admitterNote: absence.admitterNote,
      status: status,
    );
  }

  final int userId;
  final String memberName;
  final AbsenceType type;
  final DateTime startDate;
  final DateTime endDate;
  final String memberNote;
  final DateTime? rejectedAt;
  final String admitterNote;
  final AbsenceStatus status;
}
