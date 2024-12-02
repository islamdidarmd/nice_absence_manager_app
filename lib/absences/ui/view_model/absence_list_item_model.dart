import 'package:nice_absence_manager_app/absences/data/model/absence.dart';
import 'package:nice_absence_manager_app/absences/data/model/member.dart';

class AbsenceListItemModel {
  const AbsenceListItemModel({
    required this.userId,
    required this.memeberName,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.memberNote,
    required this.rejectedAt,
    required this.admitterNote,
    required this.status,
  });

  factory AbsenceListItemModel.from(Absence absence, Member member) {
    var status = 'Requested';
    if (absence.rejectedAt != null) {
      status = 'Rejected';
    } else if (absence.confirmedAt != null) {
      status = 'Confirmed';
    }

    return AbsenceListItemModel(
      userId: absence.userId,
      memeberName: member.name,
      type: absence.type,
      startDate: absence.startDate,
      endDate: absence.endDate,
      memberNote: absence.memberNote,
      rejectedAt: absence.rejectedAt,
      admitterNote: absence.admitterNote,
      status: status,
    );
  }

  final int userId;
  final String memeberName;
  final String type;
  final DateTime startDate;
  final DateTime endDate;
  final String memberNote;
  final DateTime? rejectedAt;
  final String admitterNote;
  final String status;
}
