import 'package:flutter/material.dart';
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

String formatDateRange(DateTimeRange? range) {
  if (range == null) {
    return '';
  }
  return '${formatDateTime(range.start)} - ${formatDateTime(range.end)}';
}
