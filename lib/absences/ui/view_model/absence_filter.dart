import 'package:intl/intl.dart';

enum TypeFilter { all, sickness, vacation }

String formatFilterByType(TypeFilter typeFilter) {
  return switch (typeFilter) {
    TypeFilter.all => 'Type (All)',
    TypeFilter.sickness => 'Sickness',
    TypeFilter.vacation => 'Vacation',
  };
}

String formatDateTime(DateTime time) {
  final formatter = DateFormat('MMM dd, yyyy');
  return formatter.format(time);
}

String formatDateRange(DateTime? start, DateTime? end) {
  if (start == null || end == null) {
    return '';
  }
  return '${formatDateTime(start)} - ${formatDateTime(end)}';
}
