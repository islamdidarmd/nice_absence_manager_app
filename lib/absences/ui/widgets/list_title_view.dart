import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nice_absence_manager_app/absences/ui/cubit/absence_list_cubit.dart';
import 'package:nice_absence_manager_app/absences/ui/view_model/absence_filter.dart';
import 'package:nice_absence_manager_app/absences/ui/widgets/filter_dialog.dart';

class ListTitleView extends StatelessWidget {
  const ListTitleView({
    required this.total,
    required this.typeFilter,
    required this.dateFilter,
    super.key,
  });

  final int total;
  final TypeFilter typeFilter;
  final DateTimeRange? dateFilter;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _TotalView(
              total: total,
              typeFilter: typeFilter,
              dateFilter: dateFilter,
            ),
            const Spacer(),
            _TypeFilterButton(typeFilter),
            _DatePickerFilterButton(selected: dateFilter),
          ],
        ),
      ),
    );
  }
}

class _TotalView extends StatelessWidget {
  const _TotalView({
    required this.total,
    required this.typeFilter,
    required this.dateFilter,
    super.key,
  });

  final int total;
  final TypeFilter typeFilter;
  final DateTimeRange? dateFilter;

  @override
  Widget build(BuildContext context) {
    final visibleTypeFilter = formatFilterByType(typeFilter);
    final visibleDateFilter = formatDateRange(dateFilter);
    final textStyle = Theme.of(context).textTheme.titleMedium;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total Absence: $total',
          style: textStyle,
        ),
        Text(
          visibleTypeFilter,
          style: textStyle,
        ),
        if (visibleDateFilter.isNotEmpty)
          Text(
            visibleDateFilter,
            style: textStyle,
          ),
      ],
    );
  }
}

class _TypeFilterButton extends StatelessWidget {
  const _TypeFilterButton(this.selected, {super.key});

  final TypeFilter selected;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog<void>(
          context: context,
          builder: (context) => TypeFilterDialog(selected),
        );
      },
      icon: const Icon(Icons.filter_list),
    );
  }
}

class _DatePickerFilterButton extends StatelessWidget {
  const _DatePickerFilterButton({this.selected, super.key});

  final DateTimeRange? selected;

  int get _startingYear => 2010;

  Future<DateTimeRange?> _selectDateRange(BuildContext context) {
    return showDateRangePicker(
      helpText: 'Select Date Range',
      confirmText: 'Filter',
      context: context,
      initialDateRange: selected ??
          DateTimeRange(start: DateTime(_startingYear), end: DateTime.now()),
      barrierDismissible: false,
      firstDate: DateTime(_startingYear),
      lastDate: DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        unawaited(_startDatePicker(context));
      },
      icon: const Icon(Icons.date_range),
    );
  }

  Future<void> _startDatePicker(BuildContext context) async {
    final range = await _selectDateRange(context);
    if (range != null && context.mounted) {
      unawaited(
        context.read<AbsenceListCubit>().filterAbsenceListByDate(range),
      );
    }
  }
}
