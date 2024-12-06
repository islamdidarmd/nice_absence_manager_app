import 'package:nice_absence_manager_app/feature/absences/data/model/absence.dart';
import 'package:nice_absence_manager_app/feature/absences/data/model/member.dart';

enum AbsenceStatus {
  requested,
  rejected,
  confirmed,
}

enum AbsenceType {
  vacation,
  sickness,
  other,
}

class AbsenceListItemModel {
  const AbsenceListItemModel({
    required this.userId,
    required this.picture,
    required this.memberName,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.memberNote,
    required this.rejectedAt,
    required this.admitterNote,
    required this.status,
  });

  factory AbsenceListItemModel.from(Absence absence, Member member) =>
      AbsenceListItemModel(
        userId: absence.userId,
        picture: member.image,
        memberName: member.name,
        type: _parseType(absence),
        startDate: absence.startDate,
        endDate: absence.endDate,
        memberNote: absence.memberNote,
        rejectedAt: absence.rejectedAt,
        admitterNote: absence.admitterNote,
        status: _parseStatus(absence),
      );

  final int userId;
  final String picture;
  final String memberName;
  final AbsenceType type;
  final DateTime startDate;
  final DateTime endDate;
  final String memberNote;
  final DateTime? rejectedAt;
  final String admitterNote;
  final AbsenceStatus status;
}

AbsenceStatus _parseStatus(Absence absence) {
  AbsenceStatus status;
  if (absence.rejectedAt != null) {
    status = AbsenceStatus.rejected;
  } else if (absence.confirmedAt != null) {
    status = AbsenceStatus.confirmed;
  } else {
    status = AbsenceStatus.requested;
  }
  return status;
}

AbsenceType _parseType(Absence absence) {
  AbsenceType type;
  if (absence.type == 'sickness') {
    type = AbsenceType.sickness;
  } else if (absence.type == 'vacation') {
    type = AbsenceType.vacation;
  } else {
    type = AbsenceType.other;
  }
  return type;
}
