import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nice_absence_manager_app/absences/ui/cubit/absence_list_cubit.dart';
import 'package:nice_absence_manager_app/absences/ui/widgets/filter_dialog.dart';

class ListTitleView extends StatelessWidget {
  const ListTitleView({
    required this.total,
    required this.typeFilter,
    required this.dateFilter,
    super.key,
  });

  final int total;
  final String typeFilter;
  final String dateFilter;

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
            const _TypeFilterButton(),
            const _DatePickerFilterButton(),
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
  final String typeFilter;
  final String dateFilter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total Absence: $total',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        if (typeFilter.isNotEmpty)
          Text(
            typeFilter,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        if (dateFilter.isNotEmpty)
          Text(
            dateFilter,
            style: Theme.of(context).textTheme.titleMedium,
          ),
      ],
    );
  }
}

class _TypeFilterButton extends StatelessWidget {
  const _TypeFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog<void>(
          context: context,
          builder: (context) => const FilterDialog(),
        );
      },
      icon: const Icon(Icons.filter_list),
    );
  }
}

class _DatePickerFilterButton extends StatelessWidget {
  const _DatePickerFilterButton({super.key});

  Future<DateTimeRange?> _selectDaterange(BuildContext context) {
    return showDateRangePicker(
      helpText: 'Select Date Range',
      confirmText: 'Select',
      context: context,
      initialEntryMode: DatePickerEntryMode.input,
      barrierDismissible: false,
      firstDate: DateTime(2010),
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
    final range = await _selectDaterange(context);
    if (range != null && context.mounted) {
      context.read<AbsenceListCubit>().filterAbsenceListByDate(range);
    }
  }
}
