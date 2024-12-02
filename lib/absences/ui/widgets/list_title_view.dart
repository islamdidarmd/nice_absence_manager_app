import 'package:flutter/material.dart';
import 'package:nice_absence_manager_app/absences/ui/widgets/filter_dialog.dart';

class ListTitleView extends StatelessWidget {
  const ListTitleView(this.total, this.filter, {super.key});

  final int total;
  final String filter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _TotalView(total: total, filter: filter),
          const Spacer(),
          const _TypeFilterView(),
          const _DatePickerFilterView(),
        ],
      ),
    );
  }
}

class _TotalView extends StatelessWidget {
  const _TotalView({
    super.key,
    required this.total,
    required this.filter,
  });

  final int total;
  final String filter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total Absence: $total',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          'Filter: $filter',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}

class _TypeFilterView extends StatelessWidget {
  const _TypeFilterView({super.key});

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

class _DatePickerFilterView extends StatelessWidget {
  const _DatePickerFilterView({super.key});

  Future<DateTime?> _selectDate(BuildContext context) {
    return showDatePicker(
      context: context,
      firstDate: DateTime(2010),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final startDate = await _selectDate(context);
        final endDate = await _selectDate(context);
      },
      icon: const Icon(Icons.filter_alt),
    );
  }
}
