import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nice_absence_manager_app/absences/ui/view_model/absence_list_item_model.dart';

class AbsenceListView extends StatelessWidget {
  const AbsenceListView(this.list, this.filterName, {super.key});

  final List<AbsenceListItemModel> list;
  final String filterName;

  @override
  Widget build(BuildContext context) {
    final itemCount = list.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TotalView(itemCount, filterName),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => _AbsenceListItemView(list[index]),
            separatorBuilder: (context, index) => Divider(),
            itemCount: itemCount,
          ),
        )
      ],
    );
  }
}

class _TotalView extends StatelessWidget {
  const _TotalView(this.total, this.filter, {super.key});

  final int total;
  final String filter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      ),
    );
  }
}

class _AbsenceListItemView extends StatelessWidget {
  const _AbsenceListItemView(this.absence, {super.key});

  final AbsenceListItemModel absence;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name: ${absence.memberName}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Wrap(
            spacing: 8,
            children: [
              Chip(label: Text(_formatType(absence.type))),
              Chip(label: Text(_formatStatus(absence.status))),
            ],
          ),
          Chip(
              label: Text(
                  '${_formatDateTime(absence.startDate)} - ${_formatDateTime(absence.endDate)}')),
          if (absence.memberNote.isNotEmpty) Text(absence.memberNote),
          if (absence.admitterNote.isNotEmpty) Text(absence.admitterNote),
        ],
      ),
    );
  }

  String _formatDateTime(DateTime time) {
    final formatter = DateFormat('MMM dd, yyyy');
    return formatter.format(time);
  }

  String _formatStatus(AbsenceStatus status) {
    return switch (status) {
      AbsenceStatus.requested => 'Requested',
      AbsenceStatus.rejected => 'Rejected',
      AbsenceStatus.confirmed => 'Confirmed',
    };
  }

  String _formatType(AbsenceType type) {
    return switch (type) {
      AbsenceType.vacation => 'Vacation',
      AbsenceType.sickness => 'Sickness',
    };
  }
}
