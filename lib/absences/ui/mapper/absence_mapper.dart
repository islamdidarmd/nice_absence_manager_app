import 'package:nice_absence_manager_app/absences/ui/view_model/absence_list_item_model.dart';

String mapStatusToString(AbsenceStatus status) {
  return switch (status) {
    AbsenceStatus.requested => 'Requested',
    AbsenceStatus.rejected => 'Rejected',
    AbsenceStatus.confirmed => 'Confirmed',
  };
}

String mapTypeToString(AbsenceType type) {
  return switch (type) {
    AbsenceType.vacation => 'Vacation',
    AbsenceType.sickness => 'Sickness',
  };
}
