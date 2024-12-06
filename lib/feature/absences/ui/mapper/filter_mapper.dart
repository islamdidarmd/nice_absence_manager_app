import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nice_absence_manager_app/feature/absences/ui/view_model/type_filter.dart';

//ignore_for_file: lines_longer_than_80_chars
String mapFilterByTypeToString(TypeFilter typeFilter) {
  return switch (typeFilter) {
    TypeFilter.all => 'Type (All)',
    TypeFilter.sickness => 'Sickness',
    TypeFilter.vacation => 'Vacation',
  };
}

String mapFilterDateTimeToString(DateTime time) {
  final formatter = DateFormat('MMM dd, yyyy');
  return formatter.format(time);
}

String mapFilterDateRangeToString(DateTimeRange? range) {
  if (range == null) {
    return '';
  }
  return '${mapFilterDateTimeToString(range.start)} - ${mapFilterDateTimeToString(range.end)}';
}
