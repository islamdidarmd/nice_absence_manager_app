import 'package:nice_absence_manager_app/absences/ui/view_model/absence_list_item_model.dart';

enum TypeFilter { all, sickness, vacation }

String formatFilterByType(TypeFilter typeFilter) {
  return switch (typeFilter) {
    TypeFilter.all => 'Type (All)',
    TypeFilter.sickness => 'Sickness',
    TypeFilter.vacation => 'Vacation',
  };
}

